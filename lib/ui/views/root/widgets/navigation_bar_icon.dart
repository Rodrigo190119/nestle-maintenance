import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/ui/views/root/root_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavigationBarItem extends StatelessWidget {
  final int index;
  final bool isActive;

  const NavigationBarItem({
    Key? key,
    required this.index,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: SvgPicture.asset(
            _.menuBottomBarItems![index]!['icon'],
            color: isActive ? AppColors.kPrimary : AppColors.kDisabled,
          ),
        );
      }
    );
  }
}
