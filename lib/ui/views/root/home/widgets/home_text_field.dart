import 'package:flutter/material.dart';
import 'package:flutter_maintenance/ui/global_widgets/text_field/global_text_field.dart';
import 'package:flutter_maintenance/ui/views/root/home/home_controller.dart';
import 'package:get/get.dart';

class HomeTextField extends StatelessWidget {
  final String text;
  final int index;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int? maxLength;
  final Color? color;

  const HomeTextField({
    Key? key,
    required this.text,
    required this.index,
    required this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "textField",
      builder: (_) => GlobalTextFormField(
        maxLength: maxLength,
        hintText: text,
        index: index,
        active: _.active,
        controller: _.controller[index],
        focusNode: _.focusNode,
        errorText: _.errorText[index],
        keyboardType: textInputType,
        textCapitalization: TextCapitalization.none,
        textInputAction: textInputAction,
        color: color,
        setState: () => _.update(['textField']),
        onChanged: (value) => _.onChange(),
        icon: const Icon(
          Icons.search,
          size: 25.0,
        ),
      ),
    );
  }
}
