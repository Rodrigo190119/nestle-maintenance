import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/data/models/entities/home_order_entity.dart';
import 'package:flutter_maintenance/ui/views/root/home/home_controller.dart';
import 'package:flutter_maintenance/ui/views/root/home/widgets/home_order_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOrderList extends StatelessWidget {
  const HomeOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return SliverFillRemaining(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 15.0.h, vertical: 15.0.h),
            separatorBuilder: (__, ___) => SizedBox(height: 10.0.h),
            itemCount: _.homeOrdersList.length,
            itemBuilder: (__, i) {
              HomeOrderEntity order = _.homeOrdersList[i];
              return InkWell(
                onTap: (){ _.goToAttentionOrder(entity: order); },
                borderRadius: BorderRadius.circular(10.0),
                child: HomeOrderCard(
                  onCellphoneTap: (){ _.openPhoneCaller(order.customerPhone!); },
                  onLocationTap: (){ _.openGoogleMaps(order.customerAddressUrl!); },
                  orderNumber: order.orderNumber,
                  orderState: Helpers.getStateTextByValue(order.orderState).tr,
                  requestedDate: Helpers.getFormattedDateTimeByValue(order.requestedDate),
                  customerName: order.customerName,
                  equipmentName: order.equipmentName,
                  requestCause: order.requestCause,
                  priority: Helpers.getPriorityTextByValue(order.priority).tr,
                ),
              );
            },
          )
        );
      }
    );
  }
}
