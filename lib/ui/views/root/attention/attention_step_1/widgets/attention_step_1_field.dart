import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttentionStep1Field extends StatelessWidget {
  final String title;
  final String subtitle;
  const AttentionStep1Field({
    Key? key,
    required this.title,
    required this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextTheme(context).titleContent(),
          ),
          SizedBox(height: 10.0.h),
          Text(
            subtitle,
            style: AppTextTheme(context).bodyMedium(),
          ),
        ],
      ),
    );
  }
}
