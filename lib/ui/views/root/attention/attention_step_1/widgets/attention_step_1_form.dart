import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/attention_step_1_controller.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/widgets/attention_step_1_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttentionStep1Form extends StatelessWidget {
  const AttentionStep1Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttentionStep1Controller>(
      builder: (_) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  ()=> AttentionStep1Field(
                    title: AppTextKey.STEP_1_REQUEST_DATE_TEXT.tr,
                    subtitle: Helpers.getFormattedDateTimeByValue(_.rxOrderRequestedDate.value),
                  ),
                ),
                Obx(
                  ()=> AttentionStep1Field(
                    title: AppTextKey.STEP_1_ORDER_STATE_TEXT.tr,
                    subtitle: Helpers.getStateTextByValue(_.rxOrderState.value).tr,
                  ),
                ),
                Obx(
                 ()=> AttentionStep1Field(
                   title: AppTextKey.STEP_1_CUSTOMER_NAME_TEXT.tr,
                   subtitle: _.rxCustomerName.value,
                 ),
                ),
                Obx(
                 ()=> AttentionStep1Field(
                   title: AppTextKey.STEP_1_CUSTOMER_CELLPHONE_TEXT.tr,
                   subtitle: _.rxCustomerTelephone.value,
                 ),
                ),
                Obx(
                 ()=> AttentionStep1Field(
                   title: AppTextKey.STEP_1_CUSTOMER_ADDRESS_TEXT.tr,
                   subtitle: _.rxCustomerAddress.value,
                 ),
                ),
                Obx(
                 ()=> AttentionStep1Field(
                   title: AppTextKey.STEP_1_EQUIPMENT_CODE_TEXT.tr,
                   subtitle: _.rxEquipmentCode.value,
                 ),
                ),
                Obx(
                 ()=> AttentionStep1Field(
                   title: AppTextKey.STEP_1_EQUIPMENT_NAME_TEXT.tr,
                   subtitle: _.rxEquipmentName.value,
                 ),
                ),
                Obx(
                 ()=> AttentionStep1Field(
                   title: AppTextKey.STEP_1_REQUEST_CAUSE_TEXT.tr,
                   subtitle: _.rxRequestCause.value,
                 ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
