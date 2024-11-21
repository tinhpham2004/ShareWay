import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_way_frontend/domain/chat/output/init_call_output/init_call_output.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/call/bloc/call_state.dart';

class CallBloc extends Cubit<CallState> {
  late Timer countingTimer;
  late Timer waitingTimer;

  final InitCallOutput data;

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

  void onToggleVolume() {
    emit(state.copyWith(isVolumeOn: !state.isVolumeOn));
  }

  void onToggleMic() {
    emit(state.copyWith(isMicOn: !state.isMicOn));
  }

  void onToggleVideo() {
    emit(state.copyWith(isVideoOn: !state.isVideoOn));
  }

  void onInitCall(BuildContext context) async {
    await [Permission.microphone, Permission.camera].request();
    emit(state.copyWith(rtcEngine: createAgoraRtcEngine()));
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
          // Get.toNamed(AppRoutes.message);
        },
        onUserOffline: (connection, _remoteUid, reason) {
          if (state.remoteUid == null) {
            // databaseService.UpdateCallMessage(widget.callId, 'rejected');
          } else {
            // databaseService.UpdateCallMessage(
            //     widget.callId, 'accepted' + callingTime);
          }
          emit(state.copyWith(remoteUid: null));
          waitingTimer.cancel();
          countingTimer.cancel();
          if (state.rtcEngine != null) {
            state.rtcEngine!.release();
            state.rtcEngine!.leaveChannel();
          }
          GoRouter.of(context).pop();
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
          countingTimer.cancel();
          if (state.rtcEngine != null) {
            state.rtcEngine!.release();
            state.rtcEngine!.leaveChannel();
          }
        }
      },
    );
  }
}
