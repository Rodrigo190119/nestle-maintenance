import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_theme.dart';
import 'package:flutter_maintenance/commons/theme/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonColor {
  primary,
  secondary,
  tertiary
}

enum ButtonSize {
  large,
  medium,
  small,
}

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonColor buttonColor;
  final ButtonSize buttonSize;
  final bool disabled;
  final bool showHighlightColor;
  final EdgeInsetsGeometry? margin;
  final void Function() onTap;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.disabled = false,
    this.showHighlightColor = true,
    this.margin,
    this.buttonColor = ButtonColor.primary,
    this.buttonSize = ButtonSize.large,
  }) : super(key: key);

  double get width {
    switch (buttonSize) {
      case ButtonSize.large:
        return AppValues.kBtnWidthLarge;
      case ButtonSize.medium:
        return AppValues.kBtnWidthMedium;
      case ButtonSize.small:
        return AppValues.kBtnWidthSmall;
      default:
        return AppValues.kBtnWidthLarge;
    }
  }

  double get height {
    switch (buttonSize) {
      case ButtonSize.large:
        return AppValues.kBtnHeightLarge;
      case ButtonSize.medium:
        return AppValues.kBtnHeightMedium;
      case ButtonSize.small:
        return AppValues.kBtnHeightSmall;
      default:
        return AppValues.kBtnHeightLarge;
    }
  }

  Color get color {
    switch (buttonColor) {
      case ButtonColor.primary:
        return AppColors.kPrimary;
      case ButtonColor.secondary:
        return AppColors.kSecondary;
      case ButtonColor.tertiary:
        return AppColors.kTertiary;
      default:
        return AppColors.kPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width.w,
      child: MaterialButton(
        elevation: 0.0,
        height: height.h,
        color: color,
        highlightColor: showHighlightColor == true ? null : Colors.transparent,
        highlightElevation: showHighlightColor == true ? null : 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: AppTextTheme(context).subTitle1Bold(color: Colors.white),
        ),
      ),
    );
  }
}
