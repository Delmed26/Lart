import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/Data/Repositories/auth_services.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lart/ui/widgets/textField_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = new TextEditingController();

  String _emailError = '';

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
                    controller: _emailController,
                    errorText: _emailError.isNotEmpty
                        ? 'This field is required'
                        : null,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                          onPressed: () => forgotPassword(),
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

  forgotPassword() async {
    if (_emailController.text.isNotEmpty) {
      AuthenticationService _auth = Get.find();

      String code = await _auth.forgotPassword(email: _emailController.text);
      switch (code) {
        case 'invalid-email':
          _emailError = AppLocalizations.of(context)!.invalidEmail;
          break;
        case 'user-not-found':
          _emailError = AppLocalizations.of(context)!.noUserFound;
          break;
        case '':
          Get.snackbar('', AppLocalizations.of(context)!.emailSent);
          break;
        default:
          break;
      }
    } else
      _emailError = AppLocalizations.of(context)!.fieldRequired;
  }
}
