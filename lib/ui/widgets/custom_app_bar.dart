import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  const CustomAppBar({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
