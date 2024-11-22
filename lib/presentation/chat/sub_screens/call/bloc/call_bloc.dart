import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_way_frontend/core/utils/enums/message_type_enum.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/chat/chat_repository.dart';
import 'package:share_way_frontend/domain/chat/input/update_call_input.dart';
import 'package:share_way_frontend/domain/chat/output/init_call_output/init_call_output.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/call/bloc/call_state.dart';

class CallBloc extends Cubit<CallState> {
  Timer? countingTimer;
  Timer? waitingTimer;

  final InitCallOutput data;
  final _chatRepository = ChatRepository();

  CallBloc({required this.data}) : super(CallState());
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
    emit(state.copyWith(uid: userId == data.callerId ? 0 : 1));
  }

  void onToggleVolume() async {
    if (state.remoteUid != null) {
      await state.rtcEngine?.setEnableSpeakerphone(!state.isVolumeOn);
    }
    emit(state.copyWith(isVolumeOn: !state.isVolumeOn));
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
    }
    waitingTimer?.cancel();
    countingTimer?.cancel();
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
          const RtcEngineContext(appId: '0127a16f300f4d0997ba704e3e24b26a'));

      await state.rtcEngine?.enableVideo();

      state.rtcEngine?.registerEventHandler(
        RtcEngineEventHandler(
          onRemoteVideoStateChanged:
              (connection, remoteUid, remoteVideoState, reason, elapsed) {
            emit(state.copyWith(
                isRemoteVideoOn: remoteVideoState ==
                    RemoteVideoState.remoteVideoStateStarting));
          },
          onUserJoined: (connection, remoteUid, elapsed) {
            emit(state.copyWith(remoteUid: remoteUid));
            onStartCountingTimer();
          },
          onLeaveChannel: (connection, stats) {
            GoRouter.of(context).pop();
          },
          onUserOffline: (connection, _remoteUid, reason) async {
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
            }
            emit(state.copyWith(remoteUid: null));
            waitingTimer?.cancel();
            countingTimer?.cancel();
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
        uid: state.uid ?? 0,
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
          countingTimer?.cancel();
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
}