
import 'package:flutter/material.dart';
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/base_fonts.dart';



class BaseTextField extends StatelessWidget {

  final String? placeholder;
  final String? helperText;
  final String? prefixText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  const BaseTextField({ 
    Key? key, 
    this.placeholder, 
    this.helperText, 
    this.prefixText, 
    this.controller, 
    this.onChanged, 
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: BaseColors.grey3,
      cursorWidth: 1.5,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: placeholder,
        alignLabelWithHint: true,
        helperText: helperText,
        helperMaxLines: 3,
        prefixText: prefixText,
        labelStyle: BaseFonts.subHead(color: BaseColors.grey3),
        floatingLabelStyle: BaseFonts.subHead(color: BaseColors.mainColor),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: BaseColors.grey3,
            width: 0.1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: BaseColors.mainColor,
            width: 2.3,
          )
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ) 
      ),
    );
  }
}