import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/ui/views/root/profile/profile_controller.dart';
import 'package:flutter_maintenance/ui/views/root/profile/widgets/profile_header.dart';
import 'package:flutter_maintenance/ui/views/root/profile/widgets/profile_setting_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) {
        return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                children: [
                  const ProfileHeader(),
                  SettingButton(
                    iconData: Icons.exit_to_app,
                    position: 9,
                    showArrow: false,
                    text: AppTextKey.PROFILE_OPTION_EXIT_TEXT.tr,
                    onTap: _.closeSessionAndGoToLogin,
                  ),
                  SizedBox(height: 100.0.h),
                ],
              ),
            )
        );
      }
    );
  }
}
