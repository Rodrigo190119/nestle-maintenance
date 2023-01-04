import 'package:flutter/material.dart';
import 'package:flutter_maintenance/ui/views/root/home/home_controller.dart';
import 'package:flutter_maintenance/ui/views/root/home/widgets/home_order_count.dart';
import 'package:flutter_maintenance/ui/views/root/home/widgets/home_order_filter.dart';
import 'package:flutter_maintenance/ui/views/root/home/widgets/home_order_list.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return const Scaffold(
          body: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              HomeOrderCount(),
              HomeOrderFilter(),
              HomeOrderList()
            ],
          ),
        );
      }
    );
  }
}
