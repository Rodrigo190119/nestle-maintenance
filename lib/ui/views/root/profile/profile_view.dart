import 'package:flutter/material.dart';
import 'package:flutter_maintenance/ui/views/root/profile/profile_controller.dart';
import 'package:flutter_maintenance/ui/views/root/profile/widgets/profile_options.dart';
import 'package:flutter_maintenance/ui/views/root/profile/widgets/profile_title.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) {
        return const Scaffold(
          body: CustomScrollView(
            slivers: [
              ProfileTitle(),
              ProfileOptions()
            ],
          )
        );
      }
    );
  }
}
