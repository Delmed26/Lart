import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lart/ui/widgets/textField_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {

  final TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(AppLocalizations.of(context)!.forgotPassword,
                        style: GoogleFonts.robotoSlab(textStyle: ktsSubheader)),
                  ),
                  Text(AppLocalizations.of(context)!.messageForgotPassword,
                      style: ktsBody),
                  PersonalizedTextField(
                    textInputType: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.email,
                    controller: _emailController
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(AppLocalizations.of(context)!.sendMail),
                          style: kbsButton)),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded, color: kcPrimaryColor))
          ],
        ),
      ),
    );
  }
}
