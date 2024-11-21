import 'dart:ui';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_screen.dart';
import 'package:share_way_frontend/domain/chat/output/init_call_output/init_call_output.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/call/bloc/call_bloc.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/call/bloc/call_state.dart';

class CallScreen extends StatefulWidget {
  final InitCallOutput data;

  CallScreen({required this.data});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late CallBloc bloc;

  @override
  void initState() {
    bloc = CallBloc(data: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocBuilder<CallBloc, CallState>(
        builder: (context, state) {
          if (state.isLoading) return LoadingScreen();
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                // Blurred Background
                if (state.isRemoteVideoOn) ...[
                  AgoraVideoView(
                    controller: VideoViewController.remote(
                      rtcEngine: state.rtcEngine!,
                      canvas: VideoCanvas(uid: state.remoteUid),
                      connection: RtcConnection(channelId: widget.data.roomId),
                    ),
                  ),
                ] else ...[
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
                    child: Container(
                      color: AppColor.c_40D6D4D4, // Darken the blurred area
                      child: Image.asset(
                        Assets.images.exampleAvatar
                            .path, // Use your profile image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            Assets.images.exampleAvatar.path,
                            width: 120.w,
                            height: 120.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        spaceH8,
                        Text(
                          state.currentTime != Duration.zero
                              ? state.getCallingTime
                              : 'Calling...',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],

                // Centered circular profile image

                if (state.isVideoOn)
                  Positioned(
                    left: state.videoPosition.dx,
                    top: state.videoPosition.dy,
                    child: GestureDetector(
                      onPanUpdate: (details) => bloc.onVideoDragUpdate(details),
                      child: Container(
                        height: 200.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: AgoraVideoView(
                          controller: VideoViewController(
                            rtcEngine: state.rtcEngine!,
                            canvas: VideoCanvas(
                              uid: state.uid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Call Controls at the bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          icon: Assets.icons.volume.svg(
                              color: state.isVolumeOn
                                  ? AppColor.primaryText
                                  : AppColor.white),
                          shape: BoxShape.circle,
                          backgroundColor: state.isVolumeOn
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.35),
                          isBorder: false,
                          onPressed: () => bloc.onToggleVolume(),
                        ),
                        AppButton(
                          icon: Assets.icons.missedAudioCallMessage
                              .svg(height: 56.h),
                          shape: BoxShape.circle,
                          backgroundColor: AppColor.transparent,
                          padding: EdgeInsets.zero,
                          isBorder: false,
                        ),
                        AppButton(
                          icon: Assets.icons.mic.svg(
                            height: 24.h,
                            color:
                                state.isMicOn ? AppColor.error : AppColor.white,
                          ),
                          shape: BoxShape.circle,
                          backgroundColor: state.isMicOn
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.35),
                          isBorder: false,
                          onPressed: () => bloc.onToggleMic(),
                        ),
                        AppButton(
                          icon: Assets.icons.video.svg(
                              height: 24.h,
                              color: state.isVideoOn
                                  ? AppColor.primaryText
                                  : AppColor.white),
                          shape: BoxShape.circle,
                          backgroundColor: state.isVideoOn
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.35),
                          isBorder: false,
                          onPressed: () => bloc.onToggleVideo(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
