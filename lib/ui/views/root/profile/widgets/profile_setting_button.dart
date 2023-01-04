import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';

/// [position]
/// 0 - top with border circular
/// 1 - end with border circular
/// 9 - for one item only, all border circular
/// null - body button without border circular

class SettingButton extends StatelessWidget {
  final IconData? iconData;
  final double? iconSize;
  final int? position;
  final String? text;
  final bool? showArrow;
  final VoidCallback? onTap;

  const SettingButton({
    Key? key,
    this.iconData,
    this.iconSize,
    this.position,
    this.text,
    this.showArrow = true,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: (position == 0) ? const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ) : (position == 1) ? const BorderRadius.only(
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0),
      ) : (position == 9) ? const BorderRadius.all(Radius.circular(15.0)
      ) : null,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: (position == 0) ? const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ) : (position == 1) ? const BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ) : (position == 9) ? const BorderRadius.all(Radius.circular(15.0)
            ) : null,
            color: AppColors.kCardBackground
        ),
        child: Column(
          children: [
            const SizedBox(height: 16.0,),
            Row(
              children: [
                const SizedBox(width: 15.0,),
                Icon(iconData, color: AppColors.kIconGrayColor, size: iconSize,),
                const SizedBox(width: 15.0,),
                Text(text ?? '', style: const TextStyle(color: AppColors.kTextColor, fontSize: 16.0, fontWeight: FontWeight.bold),),
                Expanded(child: Container()),
                (showArrow!) ? const Icon(Icons.chevron_right, color: AppColors.kIconGrayColor, size: 30.0,) : Container(),
                const SizedBox(width: 15.0,)
              ],
            ),
            const SizedBox(height: 16.0,),
            (position == 1 || position == 9) ? Container(height: 1.0,) : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                color: AppColors.kDivider,
              ),
            )
          ],
        ),
      ),
    );
  }
}
