
import 'package:flutter/material.dart';

InputDecoration textfieldDecoration(textColor, hintText){
  return InputDecoration(
    // prefixIcon: Icon(
    //   FontAwesomeIcons.phone,
    //   color: textColor,
    // ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: textColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: textColor),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: textColor),
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      color: textColor.withAlpha(150),
    ),
  );
}