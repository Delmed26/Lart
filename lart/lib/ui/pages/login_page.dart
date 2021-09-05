import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lart/ui/widgets/textField_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset('assets/design/login-woman-pexels.png', fit: BoxFit.fitWidth,)
              ),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(AppLocalizations.of(context)!.login, 
                        style: GoogleFonts.robotoSlab(
                          textStyle: ktsSubheader
                        )),
                    ),
                    PersonalizedTextField(
                      textInputType: TextInputType.emailAddress,
                      hintText: AppLocalizations.of(context)!.email),
                    PersonalizedTextField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: AppLocalizations.of(context)!.password,
                      autocorrect: false,
                      obscureText: true,
                      suggestions: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text(AppLocalizations.of(context)!.login),
                        style: kbsButton
                      )
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.pushNamed(context, 'forgotPassword');
                        },
                        child: Text(AppLocalizations.of(context)!.forgotPassword,
                          style: TextStyle(color: Color.fromRGBO(24, 212, 124, 1.0))
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
          SafeArea(
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.arrow_back_rounded, color: kcPrimaryColor,)
            )
          ),
        ],
      ),
    );
  }
}
