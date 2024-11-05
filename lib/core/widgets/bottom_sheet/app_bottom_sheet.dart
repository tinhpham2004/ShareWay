import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';

class AppBottomSheet extends StatelessWidget {
  final DraggableScrollableController draggableScrollableController;
  final ValueNotifier<bool> isExpanded;
  final List<Widget>? body;
  final double? height;
  AppBottomSheet({
    super.key,
    required this.draggableScrollableController,
    required this.isExpanded,
    this.body,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 1.sh,
      child: DraggableScrollableSheet(
        controller: draggableScrollableController,
        initialChildSize: 1,
        minChildSize: 0.15,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.only(bottom: 16.h),
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
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  spaceH12,
                  const Row(
                    children: [
                      Spacer(),
                      Expanded(
                        child: Divider(
                          color: AppColor.secondary300,
                          thickness: 5,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  spaceH12,
                  SizedBox(
                    height: 0.8 * (height ?? 1.sh),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: isExpanded,
                      builder: (context, isVisible, child) {
                        return Visibility(
                          visible: isVisible,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...body ?? [],
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
