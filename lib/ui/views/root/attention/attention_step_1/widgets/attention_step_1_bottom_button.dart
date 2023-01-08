import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/ui/global_widgets/button/custom_button.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/attention_step_1_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttentionStep1BottomButton extends StatelessWidget {
  const AttentionStep1BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttentionStep1Controller>(
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0.w, 5.0.h, 15.0.w, 5.0.h),
            child: Obx(
              ()=> Visibility(
                visible: _.rxOrderRealInitDate.value.isNotEmpty,
                replacement: CustomButton(
                  text: AppTextKey.STEP_1_START_ATTENTION_TEXT.tr,
                  onTap: (){ _.startAttention(); },
                ),
                child: CustomButton(
                  text: AppTextKey.ORDER_ATTENTION_CONTINUE_BUTTON_TEXT.tr,
                  onTap: (){ _.processStep1(); },
                ),
              )
            )
          )
        );
      }
    );
  }
}
