import 'package:flutter/material.dart';

class ShadowCard extends Card {
  ShadowCard({Key key, Widget child, EdgeInsetsGeometry margin})
      : super(
            key: key,
            child: child,
            margin: margin,
            elevation: 3,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0)));
}
