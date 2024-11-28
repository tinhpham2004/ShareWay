import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_way_frontend/core/utils/enums/message_type_enum.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/chat/chat_repository.dart';
import 'package:share_way_frontend/domain/chat/input/update_call_input.dart';
import 'package:share_way_frontend/domain/chat/output/chat_message_output/chat_message_output.dart';
import 'package:share_way_frontend/domain/chat/output/init_call_output/init_call_output.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/web_socket/web_socket_repository.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/call/bloc/call_state.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/chat_detail/bloc/chat_detail_bloc.dart';
import 'package:share_way_frontend/router/app_path.dart';

class CallBloc extends Cubit<CallState> {
  Timer? countingTimer;
  Timer? waitingTimer;

  final ChatDetailBloc chatDetailBloc;
  late InitCallOutput data;
  final _chatRepository = ChatRepository();
  late WebSocketRepository _webSocketRepository;

  CallBloc({required this.chatDetailBloc}) : super(CallState()) {
    data = chatDetailBloc.state.initCallOutput!;
    _webSocketRepository = WebSocketRepository(
      onUpdateCall: onRemoteUserReject,
    );
    _webSocketRepository.connect();
  }
  void onStart(BuildContext context) {
    try {
      onGetUid();
      onInitCall(context);
      onStartWaitingTimer();
    } catch (e) {
      // TODO: Add onboarding logic
    }
  }

  void onGetUid() async {
    final userId = await Preferences.getUserId();
    emit(state.copyWith(uid: userId == data.callerId ? 1 : 2));
  }

  void onToggleVolume() async {
    if (state.remoteUid != null) {
      await state.rtcEngine?.setEnableSpeakerphone(!state.isVolumeOn);
    }
    emit(state.copyWith(isVolumeOn: !state.isVolumeOn));
  }

  void onToggleSwitchCamera() async {
    await state.rtcEngine?.switchCamera();
  }

  void onToggleMic() async {
    await state.rtcEngine?.enableLocalAudio(!state.isMicOn);
    emit(state.copyWith(isMicOn: !state.isMicOn));
  }

  void onToggleVideo() async {
    await state.rtcEngine?.enableLocalVideo(!state.isVideoOn);
    if (!state.isVideoOn) {
      ChannelMediaOptions options = const ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
        channelProfile: ChannelProfileType.channelProfileCommunication,
      );
      await state.rtcEngine?.updateChannelMediaOptions(options);
    }
    emit(state.copyWith(isVideoOn: !state.isVideoOn));
  }

  void onLeaveCall(BuildContext context) async {
    if (state.remoteUid == null) {
      // databaseService.UpdateCallMessage(widget.callId, 'rejected');
      final input = UpdateCallInput(
        callId: data.callId,
        type: MessageTypeEnum.MISSED_CALL,
        roomId: data.roomId,
        duration: 0,
        receiverId: data.receiverId,
      );
      final response = await _chatRepository.updateCallStatus(input);
      if (response == null) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        return;
      }
      chatDetailBloc.onUpdateCall(response);
    } else {
      // databaseService.UpdateCallMessage(
      //     widget.callId, 'accepted' + callingTime);
      final input = UpdateCallInput(
        callId: data.callId,
        type: MessageTypeEnum.CALL,
        roomId: data.roomId,
        duration: state.currentTime.inSeconds,
        receiverId: data.receiverId,
      );
      final response = await _chatRepository.updateCallStatus(input);
      if (response == null) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        return;
      }
      chatDetailBloc.onUpdateCall(response);
    }
    if (waitingTimer != null) {
      waitingTimer!.cancel();
    }
    if (countingTimer != null) {
      countingTimer!.cancel();
    }
    if (state.rtcEngine != null) {
      state.rtcEngine!.release();
      state.rtcEngine!.leaveChannel();
    }
  }

  void onInitCall(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      emit(state.copyWith(rtcEngine: createAgoraRtcEngine()));
      await [Permission.microphone, Permission.camera].request();

      await state.rtcEngine?.initialize(
           RtcEngineContext(appId: dotenv.env['AGORA_APP_ID']));

      await state.rtcEngine?.enableVideo();

      state.rtcEngine?.registerEventHandler(
        RtcEngineEventHandler(
          onRemoteVideoStateChanged:
              (connection, remoteUid, remoteVideoState, reason, elapsed) {
            if (remoteVideoState == RemoteVideoState.remoteVideoStateStarting) {
              emit(state.copyWith(isRemoteVideoOn: true));
            }
            if (remoteVideoState == RemoteVideoState.remoteVideoStateStopped) {
              emit(state.copyWith(isRemoteVideoOn: false));
            }
          },
          onUserJoined: (connection, remoteUid, elapsed) {
            emit(state.copyWith(remoteUid: remoteUid));
            if (waitingTimer != null) {
              waitingTimer!.cancel();
            }
            onStartCountingTimer();
          },
          onLeaveChannel: (connection, stats) {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            } else {
              GoRouter.of(context)
                  .go(AppPath.chatDetail, extra: chatDetailBloc.chatRoomsBloc);
            }
          },
          onUserOffline: (connection, remoteUid, reason) async {
            if (state.remoteUid == null) {
              // databaseService.UpdateCallMessage(widget.callId, 'rejected');
              final input = UpdateCallInput(
                callId: data.callId,
                type: MessageTypeEnum.MISSED_CALL,
                roomId: data.roomId,
                duration: 0,
                receiverId: data.receiverId,
              );
              final response = await _chatRepository.updateCallStatus(input);
              if (response == null) {
                showErrorSnackbar(context, 'Đã có lỗi xảy ra');
                return;
              }
              chatDetailBloc.onUpdateCall(response);
            } else {
              // databaseService.UpdateCallMessage(
              //     widget.callId, 'accepted' + callingTime);

              final input = UpdateCallInput(
                callId: data.callId,
                type: MessageTypeEnum.CALL,
                roomId: data.roomId,
                duration: state.currentTime.inSeconds,
                receiverId: data.receiverId,
              );
              final response = await _chatRepository.updateCallStatus(input);
              if (response == null) {
                showErrorSnackbar(context, 'Đã có lỗi xảy ra');
                return;
              }
              chatDetailBloc.onUpdateCall(response);
            }
            emit(state.copyWith(remoteUid: null));
            if (waitingTimer != null) {
              waitingTimer!.cancel();
            }
            if (countingTimer != null) {
              countingTimer!.cancel();
            }
            if (state.rtcEngine != null) {
              state.rtcEngine!.release();
              state.rtcEngine!.leaveChannel();
            }
          },
        ),
      );

      await state.rtcEngine?.startPreview();

      ChannelMediaOptions options = const ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
        channelProfile: ChannelProfileType.channelProfileCommunication,
      );

      await state.rtcEngine?.joinChannel(
        token: data.token ?? '',
        channelId: data.roomId ?? '',
        uid: state.uid ?? 1,
        options: options,
      );
      await state.rtcEngine?.enableLocalVideo(false);
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onStartCountingTimer() {
    countingTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        emit(state.copyWith(
            currentTime: state.currentTime + Duration(seconds: 1)));
      },
    );
  }

  void onStartWaitingTimer() {
    waitingTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state.remainingWaitingTime > Duration.zero) {
          emit(state.copyWith(
              remainingWaitingTime:
                  state.remainingWaitingTime - Duration(seconds: 1)));
        } else {
          timer.cancel();
          if (countingTimer != null) {
            countingTimer!.cancel();
          }
          if (state.rtcEngine != null) {
            state.rtcEngine!.release();
            state.rtcEngine!.leaveChannel();
          }
        }
      },
    );
  }

  void onVideoDragUpdate(DragUpdateDetails details) {
    emit(state.copyWith(videoPosition: state.videoPosition + details.delta));
  }

  void onRemoteUserReject(ChatMessageOutput data) {
    chatDetailBloc.onReceiveUpdateCall(data);
    emit(state.copyWith(remoteUid: null));
    if (waitingTimer != null) {
      waitingTimer!.cancel();
    }
    if (countingTimer != null) {
      countingTimer!.cancel();
    }
    if (state.rtcEngine != null) {
      state.rtcEngine!.release();
      state.rtcEngine!.leaveChannel();
    }
  }
}
