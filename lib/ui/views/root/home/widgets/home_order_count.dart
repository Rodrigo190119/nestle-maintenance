import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/theme/app_text_theme.dart';
import 'package:flutter_maintenance/ui/views/root/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOrderCount extends StatelessWidget {
  const HomeOrderCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) {
          return SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            stretch: true,
            toolbarHeight: 70.0.h,
            backgroundColor: AppColors.kPrimary,
            title: Container(
              color: AppColors.kPrimary,
              height: 70.h,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppTextKey.HOME_ORDERS_COUNT_TEXT.tr,
                    style: AppTextTheme(context).bodyMedium(color: Colors.white),
                  ),
                  AnimatedDigitWidget(
                    duration: const Duration(milliseconds: 800),
                    value: _.tempOrdersList.length,
                    textStyle: AppTextTheme(context).headline4Bold(color: Colors.white),
                  )
                ],
              ),
            ),
          );
        }
    );

  }
}
