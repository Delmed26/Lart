import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PersonalizedTextField extends StatelessWidget {
  // String hintText = '';
  // TextInputType textInputType = TextInputType.text;

  // PersonalizedTextField(TextInputType textInputType, String hintText) {
  //   this.hintText = hintText;
  //   this.textInputType = textInputType;
  // }

  PersonalizedTextField(
    {required this.textInputType,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.errorText = ''});

  final TextInputType textInputType;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    bool autocorrect = !isPassword;
    bool suggestions = !isPassword;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          enableSuggestions: suggestions,
          autocorrect: autocorrect,
          keyboardType: textInputType,
          style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Color.fromRGBO(24, 212, 124, 1.0))),
          decoration: InputDecoration(
            errorText: errorText,
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          )),
    );
  }
}
