import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextFormField extends StatelessWidget {
  final int index;
  final List<bool> active;
  final TextEditingController controller;
  final List<FocusNode> focusNode;
  final TextInputAction textInputAction;
  final VoidCallback setState;
  final bool? obscureText;
  final VoidCallback? toggle;
  final TextInputType keyboardType;
  final String type;
  final String hintText;
  final int? maxLength;
  final int maxLines;
  final String? labelText;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final bool isTextArea;
  final ValueChanged<String>? onChanged;
  final Icon? icon;
  final String? prefixText;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final double textSize;
  final double height;
  final bool? withShadow;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? color;

  const GlobalTextFormField({
    Key? key,
    required this.active,
    required this.controller,
    required this.focusNode,
    required this.index,
    this.textInputAction = TextInputAction.next,
    required this.setState,
    this.obscureText,
    this.toggle,
    this.keyboardType = TextInputType.text,
    this.type = 'text',
    this.hintText = '',
    this.maxLength,
    this.maxLines = 1,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.sentences,
    this.errorText,
    this.isTextArea = false,
    this.enabled = true,
    this.onChanged,
    this.icon,
    this.prefixText,
    this.suffixIcon,
    this.prefixIcon,
    this.textSize = 16.0,
    this.height = 70.0,
    this.withShadow = false,
    this.readOnly = false,
    this.onTap,
    this.color = Colors.transparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      child: TextFormField(
        readOnly: readOnly,
        enabled: enabled,
        onTap: (onTap != null) ? onTap : () {
          for (int i = 0; i < active.length; i++) {
            active[i] = (i == index) ? true : false;
          }
          setState();
        },
        maxLength: maxLength,
        maxLines: maxLines,
        textCapitalization: textCapitalization,
        controller: controller,
        style: errorText != null
            ? TextStyle(
          color: AppColors.kErrorColor,
          fontSize: textSize,
        )
            : TextStyle(
          color: AppColors.kPrimary,
          fontSize: textSize,
        ),
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode[index],
        textInputAction: textInputAction,
        textAlign: textAlign,
        inputFormatters: (keyboardType == TextInputType.number)
            ? [FilteringTextInputFormatter.digitsOnly]
            :  null,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: icon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: errorText != null ? AppColors.kErrorColor : AppColors.kTextColor, width: 1),
            ),
            disabledBorder: const UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: errorText != null ? AppColors.kErrorColor : AppColors.kPrimary, width: 1),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: errorText != null ? AppColors.kErrorColor : AppColors.kTextColor, width: 1),
            ),
            errorText: errorText,
            labelText: hintText,
            prefixText: prefixText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0)
        ),
        keyboardType: keyboardType,
        obscureText: obscureText != null ? obscureText! : false,
        buildCounter: (BuildContext context, { int? currentLength, int? maxLength, bool? isFocused }) => null,
      ),
    );
  }
}
