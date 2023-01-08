import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_theme.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/ui/global_widgets/separators/stepper_linear_separator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttentionStepHeader extends StatelessWidget {
  final int currentStep;
  const AttentionStepHeader({
    Key? key,
    required this.currentStep
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      toolbarHeight: 60.0.h,
      primary: false,
      title: Stack(
        alignment: Alignment.topCenter,
        children: [
          StepperLinearSeparator(
            topPadding: 12.0.h,
            linearCount: 35,
            betweenPadding: 5.0.w,
            horizontalPadding: 35.w,
            height: 1.0.h,
            linearColor: AppColors.kStepEnableBackground,
            linearSecondColor: AppColors.kStepDisableBackground,
            step: currentStep,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(5, (i) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.kCardBackground,
                      radius: 15.0.r,
                      child: CircleAvatar(
                        backgroundColor: Helpers.getStepHeaderColor(currentStep, i),
                        radius: 10.0.r,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h),
                      child: Text(
                        Helpers.getStepHeaderTitle(i + 1),
                        style: AppTextTheme(context).bodySmallBold(color: Helpers.getStepHeaderColor(currentStep, i))
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
