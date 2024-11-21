// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CallStateCWProxy {
  CallState isLoading(bool isLoading);

  CallState isVolumeOn(bool isVolumeOn);

  CallState isMicOn(bool isMicOn);

  CallState isVideoOn(bool isVideoOn);

  CallState isRemoteVideoOn(bool isRemoteVideoOn);

  CallState rtcEngine(RtcEngine? rtcEngine);

  CallState uid(int? uid);

  CallState remoteUid(int? remoteUid);

  CallState remainingWaitingTime(Duration remainingWaitingTime);

  CallState currentTime(Duration currentTime);

  CallState videoPosition(Offset videoPosition);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallState(...).copyWith(id: 12, name: "My name")
  /// ````
  CallState call({
    bool? isLoading,
    bool? isVolumeOn,
    bool? isMicOn,
    bool? isVideoOn,
    bool? isRemoteVideoOn,
    RtcEngine? rtcEngine,
    int? uid,
    int? remoteUid,
    Duration? remainingWaitingTime,
    Duration? currentTime,
    Offset? videoPosition,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCallState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCallState.copyWith.fieldName(...)`
class _$CallStateCWProxyImpl implements _$CallStateCWProxy {
  const _$CallStateCWProxyImpl(this._value);

  final CallState _value;

  @override
  CallState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  CallState isVolumeOn(bool isVolumeOn) => this(isVolumeOn: isVolumeOn);

  @override
  CallState isMicOn(bool isMicOn) => this(isMicOn: isMicOn);

  @override
  CallState isVideoOn(bool isVideoOn) => this(isVideoOn: isVideoOn);

  @override
  CallState isRemoteVideoOn(bool isRemoteVideoOn) =>
      this(isRemoteVideoOn: isRemoteVideoOn);

  @override
  CallState rtcEngine(RtcEngine? rtcEngine) => this(rtcEngine: rtcEngine);

  @override
  CallState uid(int? uid) => this(uid: uid);

  @override
  CallState remoteUid(int? remoteUid) => this(remoteUid: remoteUid);

  @override
  CallState remainingWaitingTime(Duration remainingWaitingTime) =>
      this(remainingWaitingTime: remainingWaitingTime);

  @override
  CallState currentTime(Duration currentTime) => this(currentTime: currentTime);

  @override
  CallState videoPosition(Offset videoPosition) =>
      this(videoPosition: videoPosition);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallState(...).copyWith(id: 12, name: "My name")
  /// ````
  CallState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isVolumeOn = const $CopyWithPlaceholder(),
    Object? isMicOn = const $CopyWithPlaceholder(),
    Object? isVideoOn = const $CopyWithPlaceholder(),
    Object? isRemoteVideoOn = const $CopyWithPlaceholder(),
    Object? rtcEngine = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
    Object? remoteUid = const $CopyWithPlaceholder(),
    Object? remainingWaitingTime = const $CopyWithPlaceholder(),
    Object? currentTime = const $CopyWithPlaceholder(),
    Object? videoPosition = const $CopyWithPlaceholder(),
  }) {
    return CallState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isVolumeOn:
          isVolumeOn == const $CopyWithPlaceholder() || isVolumeOn == null
              ? _value.isVolumeOn
              // ignore: cast_nullable_to_non_nullable
              : isVolumeOn as bool,
      isMicOn: isMicOn == const $CopyWithPlaceholder() || isMicOn == null
          ? _value.isMicOn
          // ignore: cast_nullable_to_non_nullable
          : isMicOn as bool,
      isVideoOn: isVideoOn == const $CopyWithPlaceholder() || isVideoOn == null
          ? _value.isVideoOn
          // ignore: cast_nullable_to_non_nullable
          : isVideoOn as bool,
      isRemoteVideoOn: isRemoteVideoOn == const $CopyWithPlaceholder() ||
              isRemoteVideoOn == null
          ? _value.isRemoteVideoOn
          // ignore: cast_nullable_to_non_nullable
          : isRemoteVideoOn as bool,
      rtcEngine: rtcEngine == const $CopyWithPlaceholder()
          ? _value.rtcEngine
          // ignore: cast_nullable_to_non_nullable
          : rtcEngine as RtcEngine?,
      uid: uid == const $CopyWithPlaceholder()
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as int?,
      remoteUid: remoteUid == const $CopyWithPlaceholder()
          ? _value.remoteUid
          // ignore: cast_nullable_to_non_nullable
          : remoteUid as int?,
      remainingWaitingTime:
          remainingWaitingTime == const $CopyWithPlaceholder() ||
                  remainingWaitingTime == null
              ? _value.remainingWaitingTime
              // ignore: cast_nullable_to_non_nullable
              : remainingWaitingTime as Duration,
      currentTime:
          currentTime == const $CopyWithPlaceholder() || currentTime == null
              ? _value.currentTime
              // ignore: cast_nullable_to_non_nullable
              : currentTime as Duration,
      videoPosition:
          videoPosition == const $CopyWithPlaceholder() || videoPosition == null
              ? _value.videoPosition
              // ignore: cast_nullable_to_non_nullable
              : videoPosition as Offset,
    );
  }
}

extension $CallStateCopyWith on CallState {
  /// Returns a callable class that can be used as follows: `instanceOfCallState.copyWith(...)` or like so:`instanceOfCallState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CallStateCWProxy get copyWith => _$CallStateCWProxyImpl(this);
}
