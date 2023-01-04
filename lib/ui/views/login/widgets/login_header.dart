import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/commons/utils/images_path_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      margin: EdgeInsets.only(top: 100.h),
      child: Image.asset(
        '${Assets.images.path}${AssetsPathUtil.logoWithOutBackground}',
        fit: BoxFit.contain,
      ),
    );
  }
}
