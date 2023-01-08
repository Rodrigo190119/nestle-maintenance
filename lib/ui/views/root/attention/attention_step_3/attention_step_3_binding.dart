import 'package:flutter_maintenance/ui/views/root/attention/attention_step_3/attention_step_3_controller.dart';
import 'package:get/get.dart';

class AttentionStep3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttentionStep3Controller());
  }
}