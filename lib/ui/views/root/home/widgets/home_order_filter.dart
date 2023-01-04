import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/ui/views/root/home/widgets/home_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOrderFilter extends StatelessWidget {
  const HomeOrderFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      primary: false,
      automaticallyImplyLeading: false,
      toolbarHeight: 70.0.h,
      backgroundColor: Colors.white,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.w
        ),
        child: HomeTextField(
          text: AppTextKey.HOME_SEARCH_TEXT.tr,
          index: 0,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.done,
          color: Colors.white
        ),
      ),
    );
  }
}
