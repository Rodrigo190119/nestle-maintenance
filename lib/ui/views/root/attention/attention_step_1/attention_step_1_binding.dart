import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/attention_step_1_controller.dart';
import 'package:get/get.dart';

class AttentionStep1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttentionStep1Controller());
  }
}