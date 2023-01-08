import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/attention_step_1_controller.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/widgets/attention_step_1_bottom_button.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/widgets/attention_step_1_form.dart';
import 'package:flutter_maintenance/ui/views/root/attention/widgets/attention_details_header.dart';
import 'package:flutter_maintenance/ui/views/root/attention/widgets/attention_step_header.dart';
import 'package:get/get.dart';

class AttentionStep1View extends StatelessWidget {
  const AttentionStep1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttentionStep1Controller>(
      builder: (_) {
        return const Scaffold(
          body: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              AttentionDetailsHeader(),
              AttentionStepHeader(currentStep: AppConstants.ORDER_STEP_1),
              AttentionStep1Form()
            ],
          ),
          bottomNavigationBar: AttentionStep1BottomButton(),
        );
      }
    );
  }
}
