import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/date_time.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:share_way_frontend/core/widgets/input/text_field_input.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_list_bloc.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_list_state.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  late ChatListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ChatListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(),
      child: BlocBuilder<ChatListBloc, ChatListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: Appbar(
              title: 'Tin nhắn',
              titleColor: AppColor.white,
              backgroundColor: AppColor.primaryColor,
            ),
            bottomNavigationBar: BottomNavigation(initialIndex: 2),
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
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: TextFieldInput(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: InputDecoration(
                          prefixIcon: AppIcon.search,
                          fillColor: AppColor.white,
                          filled: true,
                          hintText: 'Tìm kiếm người dùng',
                          hintStyle: textTheme.labelLarge!.copyWith(
                            color: AppColor.secondary300,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColor.secondary300,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColor.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Container(
                        padding: EdgeInsets.only(top: 32.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.chatList.length,
                          separatorBuilder: (context, index) => spaceH8,
                          itemBuilder: (context, index) {
                            final item = state.chatList[index];
                            return InkWell(
                              // onTap: () => bloc.onSelectedHitcher(
                              //     context: context, index: index),
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.secondary200),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: ListTile(
                                  leading: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Assets.images.exampleAvatar.image(),
                                      Container(
                                        height: 10.r,
                                        width: 10.r,
                                        decoration: BoxDecoration(
                                          color: item.isOnline ?? false
                                              ? AppColor.success
                                              : AppColor.secondary300,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColor.white,
                                            width: 2.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          item.name ?? '',
                                          style: textTheme.titleSmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          item.time?.format(
                                                  pattern: dd_mm_yyyy) ??
                                              '',
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: AppColor.secondaryColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          item.lastMessage ?? '',
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: AppColor.secondaryColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
}
