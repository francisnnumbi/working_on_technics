import 'package:flutter/material.dart';

class BaseWidget extends InheritedWidget {
  late String data;

  BaseWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  static String of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BaseWidget>()?.data ?? '';

  @override
  bool updateShouldNotify(BaseWidget oldWidget) {
    return data != oldWidget.data;
  }
}
