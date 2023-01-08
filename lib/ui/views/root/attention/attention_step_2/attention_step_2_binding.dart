import 'package:flutter_maintenance/ui/views/root/attention/attention_step_2/attention_step_2_controller.dart';
import 'package:get/get.dart';

class AttentionStep2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttentionStep2Controller());
  }
}