import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  AppTextTheme(this.context);
  final BuildContext context;

  TextStyle headline4Bold({Color color = AppColors.kPrimary}) =>
      Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle titleAppBar({Color color = AppColors.kPrimary}) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle titleLargeBold({Color? color = Colors.white}) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle titleContent({Color color = AppColors.kPrimary}) =>
      Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle textFieldValue({Color? color = AppColors.kPrimary}) =>
      Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle subTitle1Normal({Color color = Colors.white}) =>
      Theme.of(context).textTheme.subtitle1!.copyWith(color: color);

  TextStyle subTitle1Bold({Color color = Colors.white}) => Theme.of(context)
      .textTheme
      .subtitle1!
      .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle bodySmallMedium({Color? color = Colors.white}) => Theme.of(context)
      .textTheme
      .bodySmall!
      .copyWith(color: color, fontWeight: FontWeight.w500);

  TextStyle bodyMedium({Color? color = AppColors.kTextColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: color);

  TextStyle bodyMediumBold({Color? color = AppColors.kTextColor}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle bodySmallNormal({Color? color = Colors.white70}) =>
      Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: color, fontSize: 12.sp);

  TextStyle bodySmallBold({Color? color = Colors.white70}) {
    return Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: color, fontSize: 12.sp, fontWeight: FontWeight.bold);
  }

  TextStyle titleMediumNormal({Color? color = Colors.white}) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(color: color);
  }

  TextStyle bodyMediumNormalUnderline({Color? color = Colors.white}) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: color, decoration: TextDecoration.underline);
  }

  TextStyle titleMediumBold({Color? color = Colors.white}) => Theme.of(context)
      .textTheme
      .titleMedium!
      .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle titleSmallNormal({Color color = Colors.white}) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(color: color);

  TextStyle titleSmallBold({Color color = Colors.white}) => Theme.of(context)
      .textTheme
      .titleSmall!
      .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle captionSmall({Color color = Colors.white}) => Theme.of(context)
      .textTheme
      .caption!
      .copyWith(color: color, fontSize: 10.sp);

  TextStyle textValidateError({Color color = AppColors.kErrorColor}) => Theme.of(context)
      .textTheme
      .caption!
      .copyWith(color: color);
}
