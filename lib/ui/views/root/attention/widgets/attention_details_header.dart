import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/theme/app_text_theme.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/attention_step_1_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttentionDetailsHeader extends StatelessWidget {
  const AttentionDetailsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttentionStep1Controller>(
      builder: (_) {
        return SliverAppBar(
          pinned: true,
          toolbarHeight: 50.0.h,
          title: Row(
            children: [
              Text(
                _.attentionOrderArguments.orderNumber.toString(),
                style: AppTextTheme(context).titleLargeBold(color: AppColors.kPrimary),
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: (){},
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: AppColors.kPrimary
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                    child: Column(
                      children: [
                        Text(
                          AppTextKey.ORDER_ATTENTION_PRIORITY_TEXT.tr,
                          style: AppTextTheme(context).bodySmallNormal(color: AppColors.kTextWhiteColor)
                        ),
                        Text(
                          Helpers.getPriorityTextByValue(_.attentionOrderArguments.priority).tr,
                          style: AppTextTheme(context).titleMediumBold(color: AppColors.kTextWhiteColor)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.0.w)
            ],
          ),
        );
      }
    );
  }
}
