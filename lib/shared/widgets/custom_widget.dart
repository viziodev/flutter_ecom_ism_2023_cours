import 'package:flutter/material.dart';

import '../constants.dart';

Text TextWidget(
    {String text = "", Color? color, double size = 25, bool bold = true}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? ecomPrymaryColor,
      fontSize: size,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
