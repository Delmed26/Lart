import 'package:flutter/material.dart';

// Colors
const Color kcPrimaryColor = Color(0xFF18D47C);
const Color kcSecondaryColor = Color(0xFF000019);
const Color kcBackgroundColor = Color.fromRGBO(242, 242, 242, 1);

// TextStyle
const TextStyle ktsSubheader = TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold, color: kcPrimaryColor);

const TextStyle ktsBody = TextStyle(
    fontSize: 14.0, color: kcSecondaryColor);

ButtonStyle kbsButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kcSecondaryColor),
    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 60)));
