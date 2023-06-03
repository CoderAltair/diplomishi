import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle setting(
    double size,
    FontWeight font,
    Color color,
  ) {
    return TextStyle(
      fontSize: size,
      fontWeight: font,
      color: color,
    );
  }

  static TextStyle title({
    double? size,
    FontWeight? font,
    Color? color,
  }) {
    return setting(size ?? 15, font ?? FontWeight.w500, color ?? Colors.black);
  }

  static TextStyle subTitle({
    double? size,
    FontWeight? font,
    Color? color,
  }) {
    return setting(size ?? 14, font ?? FontWeight.w500, color ?? Colors.black);
  }

  static TextStyle bold(
    double? size,
    FontWeight? font,
    Color? color,
  ) {
    return setting(size ?? 16, font ?? FontWeight.w700, color ?? Colors.black);
  }

  static TextStyle txtStyleWhite(
      {double fontSize = 15,
      FontWeight fontWeight = FontWeight.normal,
      Color color = const Color(0xff000000),
      FontStyle fontStyle = FontStyle.normal,
      Color bgColor = Colors.transparent}) {
    return TextStyle(
      backgroundColor: bgColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
    );
    // return GoogleFonts.aBeeZee(
    //   fontWeight: fontWeight,
    //   fontSize: fontSize,
    //   color: color,
    //   fontStyle: fontStyle,
    // );
  }
}
