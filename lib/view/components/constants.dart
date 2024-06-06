import 'package:flutter/material.dart';


const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.white54),
  labelStyle: TextStyle(color: Colors.white),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),  // Set your desired border radius here
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 3.0),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  prefixIconColor: Colors.white,
);

TextStyle LTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: 'SourceSansPro',
    color: Color(0xFF041A3A),
  );
}






