import 'package:flutter/material.dart';

import '../../util/constants/colors.dart';

InputDecoration getInputDecoration(String hintext, IconData iconData) {
  return InputDecoration(
    enabledBorder: kDefaultInputBorder,
    focusedBorder: kDefaultFocusInputBorder,
    focusedErrorBorder: kDefaultFocusErrorBorder,
    errorBorder: kDefaultFocusErrorBorder,
    filled: true,
    hintStyle: const TextStyle(color: kFormInputColor),
    hintText: hintext,
    fillColor: Colors.white70,
    prefixIcon: Icon(
      iconData,
      color: kFormInputColor,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 5),
  );
}



const kDefaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Colors.white, width: 2),
);

const kDefaultFocusInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Colors.black54, width: 2),
);
const kDefaultFocusErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.red),
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
);