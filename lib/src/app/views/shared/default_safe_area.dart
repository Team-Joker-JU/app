import 'package:flutter/material.dart';

class DefaultSafeArea extends StatelessWidget {
  final Widget child;

  DefaultSafeArea({required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(minimum: EdgeInsets.symmetric(vertical: 8, horizontal: 8), child: child);
  }
}
