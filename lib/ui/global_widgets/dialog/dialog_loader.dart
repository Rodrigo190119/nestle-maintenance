import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/commons/utils/images_path_util.dart';

class DialogLoader extends StatefulWidget {
  const DialogLoader({Key? key}) : super(key: key);

  @override
  State<DialogLoader> createState() => _DialogLoaderState();
}

class _DialogLoaderState extends State<DialogLoader>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 1500));
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _containerWidth()
     => (150.00 * _controller.value < 100) ? 100 : 150.00 * _controller.value;

  double _containerHeight()
    => (150.00 * _controller.value < 100) ? 100 : 150.00 * _controller.value;

  double _imageWidth()
    => (115.00 * _controller.value < 80) ? 65 : 95.00 * _controller.value;

  double _imageHeight()
    => (115.00 * _controller.value < 80) ? 65 : 95.00 * _controller.value;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _){
          return Center(
            child: Container(
              width: _containerWidth(),
              height: _containerHeight(),
              decoration: const BoxDecoration(
                color: AppColors.kLogoBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(75.00),
                ),
              ),
              child: Center(
                child: Container(
                  width: _imageWidth(),
                  height: _imageHeight(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("${Assets.images.path}${AssetsPathUtil.logoWithBackground}"),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              )
            )
          );
        },
      )
    );
  }
}
