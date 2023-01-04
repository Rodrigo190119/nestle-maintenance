import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/commons/utils/images_path_util.dart';
import 'package:flutter_maintenance/commons/utils/preferences_util.dart';
import 'package:flutter_maintenance/ui/views/root/profile/profile_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) {
        return Column(
          children: [
            SizedBox(height: 10.0.h),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      height: 150.0.h,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                        child: Image.asset(
                          "${Assets.images.path}${AssetsPathUtil.profileBackground}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0.h)
                  ],
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.kBackground,
                      width: 4.0
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Image.asset(
                    "${Assets.images.path}${AssetsPathUtil.profileImage}",
                    height: 35.0,
                    width: 35.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0.h),
            Text(
              Prefs.getString(AppConstants.USER_NAME_PREFS),
              style: const TextStyle(
                color: AppColors.kPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              ),
            ),
            SizedBox(height: 25.0.h),
          ],
        );
      }
    );
  }
}
