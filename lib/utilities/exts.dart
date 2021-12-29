import 'package:flutter/material.dart';

extension LitContext on BuildContext {
  double heightBy(double factor) => MediaQuery.of(this).size.height * factor;
  double widthBy(double factor) => MediaQuery.of(this).size.width * factor;
}

extension LitString on String {
  String toTitleCase() =>
      split(RegExp(r" +")).map((str) => str.toNameCase()).join(" ");

  String toNameCase() =>
      length > 0 ? "${this[0].toUpperCase()}${substring(1)}" : this;
}
