import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogue extends StatelessWidget {
  final String? title;
  final String subTitle;
  final String? noText;
  final String? yesText;
  final Function()? onYesTap;

  const CustomAlertDialogue({
    this.onYesTap,
    Key? key,
    this.title,
    required this.subTitle,
    this.noText,
    this.yesText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoAlertDialog(
        title: InkWell(
          onTap: onYesTap,
          child: Text(subTitle),
        ),
      ),
    );
  }
}
