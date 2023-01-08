import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:flutter_maintenance/ui/views/login/login_binding.dart';
import 'package:flutter_maintenance/ui/views/login/login_view.dart';
import 'package:flutter_maintenance/ui/views/login/widgets/login_middleware.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/attention_step_1_binding.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_1/attention_step_1_view.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_2/attention_step_2_binding.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_2/attention_step_2_view.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_3/attention_step_3_binding.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_3/attention_step_3_view.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_4/attention_step_4_binding.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_4/attention_step_4_view.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_5/attention_step_5_binding.dart';
import 'package:flutter_maintenance/ui/views/root/attention/attention_step_5/attention_step_5_view.dart';
import 'package:flutter_maintenance/ui/views/root/home/home_binding.dart';
import 'package:flutter_maintenance/ui/views/root/home/home_view.dart';
import 'package:flutter_maintenance/ui/views/root/profile/profile_binding.dart';
import 'package:flutter_maintenance/ui/views/root/profile/profile_view.dart';
import 'package:flutter_maintenance/ui/views/root/root_binding.dart';
import 'package:flutter_maintenance/ui/views/root/root_view.dart';
import 'package:get/get.dart';

class AppViews {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: ()=> const LoginView(),
      binding: LoginBinding(),
      middlewares: [LoginMiddleware()]
    ),
    GetPage(
      name: AppRoutes.ROOT,
      page: ()=> const RootView(),
      binding: RootBinding()
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: ()=> const HomeView(),
      binding: HomeBinding()
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: ()=> const ProfileView(),
      binding: ProfileBinding()
    ),
    GetPage(
      name: AppRoutes.ATTENTION_ORDER_STEP_1,
      page: ()=> const AttentionStep1View(),
      binding: AttentionStep1Binding()
    ),
    GetPage(
      name: AppRoutes.ATTENTION_ORDER_STEP_2,
      page: ()=> const AttentionStep2View(),
      binding: AttentionStep2Binding()
    ),
    GetPage(
      name: AppRoutes.ATTENTION_ORDER_STEP_3,
      page: ()=> const AttentionStep3View(),
      binding: AttentionStep3Binding()
    ),
    GetPage(
      name: AppRoutes.ATTENTION_ORDER_STEP_4,
      page: ()=> const AttentionStep4View(),
      binding: AttentionStep4Binding()
    ),
    GetPage(
      name: AppRoutes.ATTENTION_ORDER_STEP_5,
      page: ()=> const AttentionStep5View(),
      binding: AttentionStep5Binding()
    )
  ];
}