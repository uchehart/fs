import 'package:flutter/material.dart';
import 'package:foodsub/utilities/constants.dart';

extension LitContext on BuildContext {
  SizedBox heightBox(int value) => SizedBox(height: height(value));
  SizedBox widthBox(int value) => SizedBox(width: width(value));

  double height(int value) =>
      MediaQuery.of(this).size.height * value / modelHeight;

  double width(int value) =>
      MediaQuery.of(this).size.width * value / modelWidth;
}

extension LitString on String {
  String toTitleCase() =>
      split(RegExp(r" +")).map((str) => str.toNameCase()).join(" ");

  String toNameCase() =>
      length > 0 ? "${this[0].toUpperCase()}${substring(1)}" : this;
}
