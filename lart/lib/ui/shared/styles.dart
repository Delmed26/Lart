import 'package:flutter/material.dart';

// Colors
const Color kcPrimaryColor = Color(0xFF18D47C);
const Color kcSecondaryColor = Color(0xFF000019);

// TextStyle
const TextStyle ktsSubheader = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: kcPrimaryColor);

ButtonStyle kbsButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kcSecondaryColor),
    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 60)));
