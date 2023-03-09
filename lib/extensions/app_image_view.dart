import 'package:flutter/material.dart';

extension View on String {
  ImageProvider getView() {
    if (this =="") {
      return AssetImage(
        this,
      );
    } else {
      return NetworkImage(
     // return NetworkImage(
        this ,
      );
    }
  }
}
