import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maintenance/commons/configuration/app_configuration.dart';
import 'package:flutter_maintenance/commons/theme/app_text_locale.dart';
import 'package:flutter_maintenance/commons/theme/app_theme.dart';
import 'package:flutter_maintenance/commons/utils/dependency_injection.dart';
import 'package:flutter_maintenance/commons/utils/preferences_util.dart';
import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:flutter_maintenance/routes/app_views.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  AppConfiguration.init();
  DependencyInjection.load();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          title: 'SSTT D\'onofrio',
          debugShowCheckedModeBanner: AppConfiguration.isTestingEnvironment(),
          defaultTransition: Transition.fade,
          theme: lightTheme(context),
          initialRoute: AppRoutes.LOGIN,
          getPages: AppViews.pages,
          locale: const Locale('es', 'PE'),
          translations: AppTextLocale(),
          builder: (__, _) {
            return ScrollConfiguration(
              behavior: GlowRemover(),
              child: _!,
            );
          },
        );
      }
    );
  }
}

class GlowRemover extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    const GlowingOverscrollIndicator(
      color: Colors.transparent,
      axisDirection: AxisDirection.up,
    );
    return child;
  }
}