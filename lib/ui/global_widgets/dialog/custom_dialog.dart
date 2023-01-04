import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  final bool isPrimaryBanner;
  final String? imagePathBanner;
  final String? headerTitle;
  final String? title;
  final String content;
  final String? textPrimaryButton;
  final String? textSecondaryButton;
  final String preferencesKey;
  final bool isOnlyPrimary;
  final bool isHiddenPrimary;
  final bool isPrimaryButton;
  final bool isDismissibleDialog;
  final bool isDoNotShowAgainButton;
  final Widget? widgetContent;
  final VoidCallback onTapButton;
  final VoidCallback? onTapButtonSecondary;

  const CustomDialog({
    Key? key,
    this.isPrimaryBanner = false,
    this.imagePathBanner,
    this.headerTitle,
    this.title,
    this.content = "",
    this.textPrimaryButton = "Sí",
    this.textSecondaryButton = "No",
    this.preferencesKey = '',
    this.isOnlyPrimary = false,
    this.isHiddenPrimary = false,
    this.isPrimaryButton = true,
    this.isDoNotShowAgainButton = false,
    this.isDismissibleDialog = true,
    this.widgetContent,
    required this.onTapButton,
    this.onTapButtonSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (isDismissibleDialog) ? null : () => Future.value(false),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: (headerTitle != null) ? Text(headerTitle!,) : null,
        contentPadding: const EdgeInsets.all(0.0),
        content: (widgetContent != null) ? widgetContent : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: imagePathBanner != null,
              replacement: const SizedBox.shrink(),
              child: Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.all(10.0.h,),
                decoration: BoxDecoration(
                  color: (isPrimaryBanner) ? AppColors.kPrimary : null,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                ),
                child: Image.asset(
                  imagePathBanner!,
                  color: (isPrimaryBanner) ? Colors.white : null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                      visible: title != null,
                      replacement: const SizedBox.shrink(),
                      child: Column(
                        children: [
                          Text(
                            title!,
                            //style: AppTextTheme(context).bodyMediumBold(fontSize: 20.sp),
                            style: AppTextTheme(context).bodyMediumBold(),
                          ),
                          SizedBox(height: 15.h)
                        ],
                      )
                  ),
                  Text(
                    content,
                    style: AppTextTheme(context).bodyMedium(),
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        actionsOverflowAlignment: (isOnlyPrimary) ? OverflowBarAlignment.center : null,
        actions: [
          Visibility(
              visible: !isOnlyPrimary,
              replacement: Container(),
              child: MaterialButton(
                elevation: 0.0,
                height: 35.0.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                onPressed: (onTapButtonSecondary != null) ? onTapButtonSecondary : (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  textSecondaryButton!,
                  style: AppTextTheme(context).subTitle1Bold(color: AppColors.kTextColor),
                ),
              )
          ),
          MaterialButton(
            elevation: 0.0,
            height: 35.0.h,
            color: (isPrimaryButton) ? AppColors.kPrimary : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            onPressed: onTapButton,
            child: Text(
              textPrimaryButton!,
              style: AppTextTheme(context).subTitle1Bold(color: (isPrimaryButton)
                  ? Colors.white
                  : AppColors.kTextColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
