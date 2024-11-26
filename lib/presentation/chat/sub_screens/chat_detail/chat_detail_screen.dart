import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/date_time.dart';
import 'package:share_way_frontend/core/utils/enums/message_type_enum.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/input/text_field_input.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_widget.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_bloc.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/chat_detail/bloc/chat_detail_bloc.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/chat_detail/bloc/chat_detail_state.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatRoomsBloc chatRoomsBloc;
  const ChatDetailScreen({super.key, required this.chatRoomsBloc});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  late ChatDetailBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ChatDetailBloc(chatRoomsBloc: widget.chatRoomsBloc);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(),
      child: BlocBuilder<ChatDetailBloc, ChatDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: Appbar(
              titleWidget: ListTile(
                leading: Assets.images.exampleAvatar.image(),
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        bloc.chatRoomsBloc.state.selectedChat?.receiver
                                ?.fullName ??
                            '',
                        style: textTheme.titleMedium!.copyWith(
                          color: AppColor.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                AppButton(
                  flex: 0,
                  shape: BoxShape.circle,
                  icon: AppIcon.audioCall,
                  backgroundColor: AppColor.white,
                  padding: EdgeInsets.all(8.w),
                  isEnabled: !state.isSendingCall,
                  onPressed: () => bloc.onInitCall(context),
                ),
                spaceW16,
              ],
              backgroundColor: AppColor.primaryColor,
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Expanded(child: Container(color: AppColor.primaryColor)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                      color: AppColor.transparent,
                    )),
                    Expanded(
                      flex: 13,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            state.isLoading
                                ? const Expanded(
                                    child: Center(child: LoadingWidget()))
                                : Expanded(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      reverse: true,
                                      separatorBuilder: (context, index) =>
                                          spaceH8,
                                      itemCount: state.messages.length,
                                      itemBuilder: (context, indexReverse) {
                                        final index = state.messages.length -
                                            1 -
                                            indexReverse;
                                        final item = state.messages[index];
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: item.senderId !=
                                                  bloc
                                                      .chatRoomsBloc
                                                      .state
                                                      .selectedChat
                                                      ?.receiver
                                                      ?.id
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                          children: [
                                            if (index == 0 ||
                                                !state
                                                    .messages[index].createdAt!
                                                    .isSameDay(state
                                                        .messages[index - 1]
                                                        .createdAt!)) ...[
                                              Center(
                                                child: Text(
                                                  state.messages[index]
                                                          .createdAt!
                                                          .isToday()
                                                      ? 'TODAY'
                                                      : state.messages[index]
                                                          .createdAt!
                                                          .format(
                                                              pattern:
                                                                  dd_mm_yyyy),
                                                  style: textTheme.bodyLarge!
                                                      .copyWith(
                                                    color:
                                                        AppColor.secondary300,
                                                  ),
                                                ),
                                              ),
                                              spaceH16,
                                            ],
                                            item.messageType ==
                                                    MessageTypeEnum.TEXT
                                                ? Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.h),
                                                    padding:
                                                        EdgeInsets.all(12.w),
                                                    decoration: BoxDecoration(
                                                      color: item.senderId !=
                                                              bloc
                                                                  .chatRoomsBloc
                                                                  .state
                                                                  .selectedChat
                                                                  ?.receiver
                                                                  ?.id
                                                          ? AppColor
                                                              .primaryColor
                                                          : null,
                                                      border: item.senderId ==
                                                              bloc
                                                                  .chatRoomsBloc
                                                                  .state
                                                                  .selectedChat
                                                                  ?.receiver
                                                                  ?.id
                                                          ? Border.all(
                                                              color: AppColor
                                                                  .secondary200,
                                                            )
                                                          : null,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: item
                                                                    .senderId !=
                                                                bloc
                                                                    .chatRoomsBloc
                                                                    .state
                                                                    .selectedChat
                                                                    ?.receiver
                                                                    ?.id
                                                            ? Radius.circular(
                                                                10.r)
                                                            : Radius.circular(
                                                                3.r),
                                                        topRight: item
                                                                    .senderId ==
                                                                bloc
                                                                    .chatRoomsBloc
                                                                    .state
                                                                    .selectedChat
                                                                    ?.receiver
                                                                    ?.id
                                                            ? Radius.circular(
                                                                10.r)
                                                            : Radius.circular(
                                                                3.r),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10.r),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.r),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      item.message ?? '',
                                                      style: textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                        color: item.senderId !=
                                                                bloc
                                                                    .chatRoomsBloc
                                                                    .state
                                                                    .selectedChat
                                                                    ?.receiver
                                                                    ?.id
                                                            ? AppColor.white
                                                            : AppColor
                                                                .secondaryColor,
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    padding:
                                                        EdgeInsets.all(8.w),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: AppColor
                                                            .secondary200,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: item
                                                                    .senderId !=
                                                                bloc
                                                                    .chatRoomsBloc
                                                                    .state
                                                                    .selectedChat
                                                                    ?.receiver
                                                                    ?.id
                                                            ? Radius.circular(
                                                                10.r)
                                                            : Radius.circular(
                                                                3.r),
                                                        topRight: item
                                                                    .senderId ==
                                                                bloc
                                                                    .chatRoomsBloc
                                                                    .state
                                                                    .selectedChat
                                                                    ?.receiver
                                                                    ?.id
                                                            ? Radius.circular(
                                                                10.r)
                                                            : Radius.circular(
                                                                3.r),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10.r),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.r),
                                                      ),
                                                    ),
                                                    child: item.messageType ==
                                                            MessageTypeEnum
                                                                .IMAGE
                                                        ? InkWell(
                                                            onTap: () =>
                                                                _showZoomableImageDialog(
                                                                    context,
                                                                    item.message ??
                                                                        ''),
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth:
                                                                    0.5.sw,
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    item.message ??
                                                                        '',
                                                                placeholder: (context,
                                                                        url) =>
                                                                    const CircularProgressIndicator(
                                                                  color: AppColor
                                                                      .primaryColor,
                                                                  strokeWidth:
                                                                      2.0,
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Assets
                                                                        .images
                                                                        .failToLoadImage
                                                                        .image(),
                                                              ),
                                                            ),
                                                          )
                                                        : Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              item.messageType
                                                                  .getIcon(),
                                                              SizedBox(
                                                                  width: 8.w),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    item.messageType
                                                                        .getMessageTitle(),
                                                                    style: textTheme
                                                                        .titleSmall,
                                                                  ),
                                                                  Text(
                                                                    item.message ??
                                                                        '',
                                                                    style: textTheme
                                                                        .bodyMedium!
                                                                        .copyWith(
                                                                      color: AppColor
                                                                          .secondary300,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                  ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.w, right: 8.w),
                                              child: Text(
                                                item.createdAt?.format(
                                                        pattern: hh_mm_a) ??
                                                    '',
                                                style: textTheme.labelSmall!
                                                    .copyWith(
                                                  color: AppColor.secondary300,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                            SizedBox(height: 0.15.sh),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        left: 16.w,
                        bottom: 32.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        border: const Border(
                          top: BorderSide(
                            color: AppColor.c_FFECECEC,
                            width: 2.0,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.c_40B6C8E4,
                            blurRadius: 20.r,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFieldInput(
                                controller: state.messageController,
                                decoration: InputDecoration(
                                  hintText: 'Soạn tin nhắn',
                                  hintStyle: textTheme.labelLarge!.copyWith(
                                    color: AppColor.secondary300,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  fillColor: AppColor.secondary100,
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                    left: 16.w,
                                    top: 8.h,
                                    bottom: 8.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColor.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => showImagePicker(),
                                    child: AppIcon.pickImage,
                                  ),
                                ),
                              ),
                            ),
                            AppButton(
                              flex: 0,
                              shape: BoxShape.circle,
                              icon: AppIcon.sendMessage,
                              backgroundColor: AppColor.primaryColor,
                              isBorder: false,
                              padding: EdgeInsets.all(8.w),
                              isMargin: true,
                              isEnabled: !state.isSendingMessage,
                              onPressed: () => bloc.onSendMessage(context),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> showImagePicker() async {
    bloc.chatRoomsBloc.onFetchAssets(context);
    List<File> assets = List<File>.from(bloc.chatRoomsBloc.state.assets);

    showModalBottomSheet(
      backgroundColor: AppColor.white,
      context: context,
      isScrollControlled: true,
      barrierColor: AppColor.transparent,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: bloc,
          child: BlocBuilder<ChatDetailBloc, ChatDetailState>(
            builder: (context, state) {
              return Container(
                height: 0.5.sh,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.c_403A3A3A,
                            offset: Offset(4.w, 4.h),
                            blurRadius: 70.r,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tất cả ảnh',
                            style: textTheme.titleMedium,
                          ),
                          InkWell(
                            onTap: state.selectedImage != null
                                ? () => bloc.onSendImage(context)
                                : null,
                            child: Text(
                              'Gửi',
                              style: textTheme.titleSmall!.copyWith(
                                color: state.selectedImage != null
                                    ? AppColor.primaryColor
                                    : AppColor.secondary300,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemCount: assets.length,
                        itemBuilder: (context, index) {
                          final asset = assets[index];
                          return InkWell(
                            onTap: () => bloc.onSelectImage(
                                asset == state.selectedImage ? null : asset),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.file(
                                    asset,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8.h,
                                  right: 8.w,
                                  child: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: state.selectedImage == asset
                                          ? AppColor.primaryColor
                                          : AppColor.white,
                                      border: Border.all(
                                        color: state.selectedImage == asset
                                            ? AppColor.primaryColor
                                            : AppColor.secondary300,
                                        width: 2.w,
                                      ),
                                    ),
                                    child: state.selectedImage == asset
                                        ? AppIcon.check
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showZoomableImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(imageUrl),
            backgroundDecoration:
                const BoxDecoration(color: AppColor.transparent),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        ),
      ),
    );
  }
}
