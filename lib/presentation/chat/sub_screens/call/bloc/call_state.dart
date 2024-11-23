import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

part 'call_state.g.dart';

@CopyWith()
class CallState {
  final bool isLoading;
  final bool isVolumeOn;
  final bool isMicOn;
  final bool isVideoOn;
  final bool isRemoteVideoOn;
  final RtcEngine? rtcEngine;
  final int? uid;
  final int? remoteUid;
  final Duration remainingWaitingTime;
  final Duration currentTime;
  final Offset videoPosition;

  String get getCallingTime {
    final hours = currentTime.inHours.toString().padLeft(2, '0');
    final minutes = (currentTime.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (currentTime.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  CallState({
    this.isLoading = false,
    this.isVolumeOn = false,
    this.isMicOn = false,
    this.isVideoOn = false,
    this.isRemoteVideoOn = false,
    this.rtcEngine,
    this.uid,
    this.remoteUid,
    this.remainingWaitingTime = const Duration(seconds: 60),
    this.currentTime = Duration.zero,
    this.videoPosition = const Offset(20, 20),
  });
}
