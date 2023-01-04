import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/environment/environment.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/ui/views/login/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: _.copyDataToClipboard,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                          '${AppTextKey.VERSION_TEXT.tr}: ${_.appVersion.value}-${Environment.appConfig["environment"]}',
                          style: Theme.of(context).textTheme.caption?.copyWith(color: AppColors.kTextColor),
                        )),
                        Obx(() => Text(
                          '${AppTextKey.DEVICE_MODEL_TEXT.tr}: ${_.deviceModel.value}',
                          style: Theme.of(context).textTheme.caption?.copyWith(color: AppColors.kTextColor),
                        )),
                        Obx(()=> Text(
                          '${AppTextKey.BUILD_NUMBER_TEXT.tr}: ${_.buildNumber.value}',
                          style: Theme.of(context).textTheme.caption?.copyWith(color: AppColors.kTextColor),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
