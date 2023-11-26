import 'package:flutter/material.dart';

import 'loading.widget.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;

  const BaseWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        const LoadingWidget(),
      ],
    );
  }
}
