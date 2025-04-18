
import 'package:flutter/cupertino.dart';

extension MapRevelationType on BuildContext {
  String mapRevelationType(String revelationType) {
    if(revelationType == "Meccan") {
      return "Makiyyah";
    }else {
      return "Madaniyyah";
    }
  }
}