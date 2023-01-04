import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeOrderCard extends StatelessWidget {
  final String? orderNumber;
  final String? orderState;
  final String? requestedDate;
  final String? customerName;
  final String? equipmentName;
  final String? requestCause;
  final String? priority;
  final void Function()? onCellphoneTap;
  final void Function()? onLocationTap;

  const HomeOrderCard({
    Key? key,
    required this.orderNumber,
    required this.orderState,
    required this.requestedDate,
    required this.customerName,
    required this.equipmentName,
    required this.requestCause,
    required this.priority,
    required this.onCellphoneTap,
    required this.onLocationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.kCardBackground
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.0.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
            child: Row(
              children: [
                Text(orderNumber.toString(), style: AppTextTheme(context).bodyMediumBold(color: Colors.black)),
                const Spacer(),
                Text(orderState.toString(), style: AppTextTheme(context).bodyMediumBold(color: AppColors.kPrimary)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
            child: Text(requestedDate.toString(), style: AppTextTheme(context).bodyMediumBold(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
            child: Text(customerName.toString(), style: AppTextTheme(context).bodyMediumBold(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
            child: Text(equipmentName.toString(), style: AppTextTheme(context).bodyMediumBold(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
            child: Text(requestCause.toString(), style: AppTextTheme(context).bodyMediumBold(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.kPrimary
                  ),
                  child: Text(priority.toString(), style: AppTextTheme(context).bodyMediumBold(color: Colors.white))
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onCellphoneTap,
                  child: const Icon(Icons.call)
                ),
                SizedBox(width: 15.0.w),
                GestureDetector(
                  onTap: onLocationTap,
                  child: const Icon(Icons.location_on)
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0.h),
          Container(
            height: 10.0.h,
            decoration: const BoxDecoration(
              color: AppColors.kPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              )
            ),
          )
        ],
      ),
    );
  }
}
