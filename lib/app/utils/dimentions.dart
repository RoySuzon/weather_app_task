import 'package:flutter/material.dart';

extension Extention on BuildContext {
  height(double size) {
    // print(MediaQuery.of(this).size.width);             2
    return (MediaQuery.of(this).size.height / 844.0) * size;
  }

  width(double size) {
    return (MediaQuery.of(this).size.width / 390.0) * size;
  }
}
