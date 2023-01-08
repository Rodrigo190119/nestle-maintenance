import 'package:flutter_maintenance/ui/views/root/attention/attention_step_4/attention_step_4_controller.dart';
import 'package:get/get.dart';

class AttentionStep4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttentionStep4Controller());
  }
}