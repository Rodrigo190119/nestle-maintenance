import 'package:flutter/material.dart';
import 'package:flutter_maintenance/ui/views/root/root_controller.dart';
import 'package:flutter_maintenance/ui/views/root/widgets/navigation_bar_icon.dart';
import 'package:get/get.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      builder: (_) {
        return Obx(
          () {
            return Scaffold(
              body: _.navigationPages![_.currentViewIndex.value],
              bottomNavigationBar: BottomNavigationBar(
                onTap: _.changeCurrentViewIndex,
                currentIndex: _.currentViewIndex.value,
                items: List<BottomNavigationBarItem>.generate(
                  _.menuBottomBarItems!.length,
                  (index) => BottomNavigationBarItem(
                    icon: NavigationBarItem(index: index, isActive: false),
                    label: _.menuBottomBarItems![index]!['label'],
                    activeIcon: NavigationBarItem(index: index, isActive: true),
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
}