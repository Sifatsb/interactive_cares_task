import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? fillColor;
  final String? hintText;
  final bool focusBorderActive;
  final bool enableBorderActive;
  final bool obsCureText;
  final Widget? suffixIcon;
  final Function()? iconOnTap;
  final TextInputType? textInputType;
  final TextStyle? labelTextStyle;
  final Color? enableBorderActiveColor;
  final int? maxLine;
  final Function()? onTap;
  final bool readOnly;

  const CustomTextFormField({
    this.controller,
    this.fillColor,
    this.hintText,
    this.focusBorderActive = false,
    this.enableBorderActive = false,
    this.suffixIcon,
    this.iconOnTap,
    this.obsCureText = false,
    this.textInputType,
    this.labelTextStyle,
    this.enableBorderActiveColor,
    this.maxLine,
    this.onTap,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextFormField(
        controller: controller,
        obscureText: obsCureText,
        keyboardType: textInputType,
        minLines: 1,
        maxLines: maxLine ?? 1,
        readOnly: readOnly,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? const Color(0xFFFDFBFF),
          hintText: hintText ?? 'Enter text',
          suffixIcon:
              InkWell(onTap: iconOnTap, child: suffixIcon ?? const SizedBox()),
          focusedBorder: focusBorderActive
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFF635976).withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8.0),
                )
              : null,
          enabledBorder: enableBorderActive
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: enableBorderActiveColor ??
                          const Color(0xFF635976).withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8.0),
                )
              : null,
        ),
      ),
    );
  }
}

