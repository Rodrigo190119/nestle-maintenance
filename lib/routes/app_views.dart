import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:flutter_maintenance/ui/views/login/login_binding.dart';
import 'package:flutter_maintenance/ui/views/login/login_view.dart';
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
      binding: LoginBinding()
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
    )
  ];
}