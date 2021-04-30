import 'package:flutter/material.dart';

class ShadowCard extends Card {
  ShadowCard({required Key key, Widget? child, required EdgeInsetsGeometry margin})
      : super(
            key: key,
            child: child,
            margin: margin,
            elevation: 3,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0)));
}
