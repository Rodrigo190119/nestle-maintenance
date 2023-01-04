import 'package:flutter/material.dart';
import 'package:flutter_maintenance/ui/global_widgets/scaffold/custom_scaffold.dart';
import 'package:flutter_maintenance/ui/views/login/login_controller.dart';
import 'package:flutter_maintenance/ui/views/login/widgets/login_footer.dart';
import 'package:flutter_maintenance/ui/views/login/widgets/login_form.dart';
import 'package:flutter_maintenance/ui/views/login/widgets/login_header.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return const CustomScaffold(
          header: LoginHeader(),
          body: LoginForm(),
          footer: LoginFooter(),
        );
      }
    );
  }
}
