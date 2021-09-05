import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalizedTextField extends StatelessWidget {
  // String hintText = '';
  // TextInputType textInputType = TextInputType.text;

  // PersonalizedTextField(TextInputType textInputType, String hintText) {
  //   this.hintText = hintText;
  //   this.textInputType = textInputType;
  // }

  PersonalizedTextField({
    required this.textInputType, 
    required this.hintText, 
    this.obscureText = false, 
    this.autocorrect = true, 
    this.suggestions = true});

  final TextInputType textInputType;
  final String hintText;
  final bool obscureText;
  final bool autocorrect;
  final bool suggestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
          obscureText: obscureText,
          enableSuggestions: suggestions,
          autocorrect: autocorrect,
          keyboardType: textInputType,
          style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Color.fromRGBO(24, 212, 124, 1.0))),
          decoration: InputDecoration(
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
