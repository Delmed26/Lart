import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:lart/ui/widgets/textField_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0, top: 20.0),
                  child: Image.asset(
                    'assets/design/Lart.png',
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    AppLocalizations.of(context)!.createAccount,
                    style: GoogleFonts.robotoSlab(
                      textStyle: ktsSubheader
                    ),
                  ),
                ),
                PersonalizedTextField(
                  textInputType: TextInputType.text,
                  hintText: AppLocalizations.of(context)!.name),
                PersonalizedTextField(
                  textInputType: TextInputType.emailAddress,
                  hintText: AppLocalizations.of(context)!.email),
                PersonalizedTextField(
                  textInputType: TextInputType.visiblePassword,
                  hintText: AppLocalizations.of(context)!.password,
                  obscureText: true,
                  autocorrect: false,
                  suggestions: false
                ),
                PersonalizedTextField(
                  textInputType: TextInputType.visiblePassword,
                  hintText: AppLocalizations.of(context)!.confirmPassword,
                  obscureText: true,
                  autocorrect: false,
                  suggestions: false
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(AppLocalizations.of(context)!.signUp),
                    style: kbsButton
                  )
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: MaterialButton(
                      onPressed: () => {},
                      child: Text(AppLocalizations.of(context)!.alreadyAccount, style: TextStyle(color: Color.fromRGBO(24, 212, 124, 1.0))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
