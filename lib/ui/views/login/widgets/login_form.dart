import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/ui/global_widgets/button/custom_button.dart';
import 'package:flutter_maintenance/ui/views/login/login_controller.dart';
import 'package:flutter_maintenance/ui/views/login/widgets/login_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 30.h),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            children: [
              LoginTextField(
                text: AppTextKey.LOGIN_USERNAME_TEXT.tr,
                index: 0,
                textInputType: TextInputType.text,
                icon: const Icon(
                  Icons.person_outline,
                  size: 25.0,
                ),
              ),
              SizedBox(height: 1.h),
              LoginTextField(
                text: AppTextKey.LOGIN_PASSWORD_TEXT.tr,
                index: 1,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: true,
                showEyeButton: true,
                icon: const Icon(
                  Icons.lock_outline,
                  size: 25.0,
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: AppTextKey.LOGIN_TEXT.tr,
                onTap: _.validLoginForm
              )
            ],
          ),
        );
      },
    );
  }
}
