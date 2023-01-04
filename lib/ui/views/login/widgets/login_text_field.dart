import 'package:flutter/material.dart';
import 'package:flutter_maintenance/ui/global_widgets/text_field/global_text_field.dart';
import 'package:flutter_maintenance/ui/views/login/login_controller.dart';
import 'package:get/get.dart';

class LoginTextField extends StatelessWidget {
  final String text;
  final int index;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final IconButton? prefixIconButton;
  final bool showEyeButton;
  final Icon? icon;
  const LoginTextField({
    Key? key,
    required this.text,
    required this.index,
    required this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.prefixIconButton,
    this.showEyeButton = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
       id: "textField",
       builder: (_){
         return GlobalTextFormField(
             hintText: text,
             index: index,
             active: _.active,
             controller: _.controller[index],
             focusNode: _.focusNode,
             errorText: _.errorText[index],
             keyboardType: textInputType,
             textCapitalization: TextCapitalization.none,
             textInputAction: textInputAction,
             obscureText: (showEyeButton) ? !_.isVisiblePassword : obscureText,
             setState: () => _.update(['textField']),
             onChanged: (value) => _.onChange(),
             icon: icon,
             prefixIcon: prefixIconButton,
             suffixIcon: (showEyeButton)
                 ? IconButton(
               onPressed: (){
                 _.showPassword();
               },
               icon: (_.isVisiblePassword)
                   ? const Icon(Icons.visibility)
                   : const Icon(Icons.visibility_off),
               //color: MyColors.iconBlack,
               iconSize: 20.0,
             )
                 : null
         );
       }
    );
  }
}
