import 'package:flutter_maintenance/ui/views/root/attention/attention_step_5/attention_step_5_controller.dart';
import 'package:get/get.dart';

class AttentionStep5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttentionStep5Controller());
  }
}