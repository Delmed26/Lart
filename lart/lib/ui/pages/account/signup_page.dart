import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/Data/Repositories/auth_services.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:lart/ui/widgets/textField_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: screenSize.height > 700
                ? SignupLargeScreen()
                : SignupSmallScreen()),
      ),
    );
  }
}

TextEditingController _emailController = new TextEditingController();
TextEditingController _passController = new TextEditingController();
TextEditingController _nameController = new TextEditingController();
TextEditingController _confirmPassController = new TextEditingController();

class SignupLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
          child: Image.asset(
            'assets/design/Lart.png',
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            AppLocalizations.of(context)!.createAccount,
            textScaleFactor: 1,
            style: GoogleFonts.robotoSlab(textStyle: ktsSubheader),
          ),
        ),
        PersonalizedTextField(
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.name,
            controller: _nameController),
        PersonalizedTextField(
          textInputType: TextInputType.emailAddress,
          hintText: AppLocalizations.of(context)!.email,
          controller: _emailController,
        ),
        PersonalizedTextField(
            textInputType: TextInputType.visiblePassword,
            hintText: AppLocalizations.of(context)!.password,
            isPassword: true,
            controller: _passController),
        PersonalizedTextField(
            textInputType: TextInputType.visiblePassword,
            hintText: AppLocalizations.of(context)!.confirmPassword,
            isPassword: true,
            controller: _confirmPassController),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ElevatedButton(
                onPressed: () => signUp(context),
                child: Text(AppLocalizations.of(context)!.signUp),
                style: kbsButton)),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: MaterialButton(
              onPressed: () => {Navigator.pushNamed(context, 'login')},
              child: Text(AppLocalizations.of(context)!.alreadyAccount,
                  style: TextStyle(color: Color.fromRGBO(24, 212, 124, 1.0))),
            ),
          ),
        ),
      ],
    );
  }
}

class SignupSmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
          child: Image.asset(
            'assets/design/Lart.png',
            height: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            AppLocalizations.of(context)!.createAccount,
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: GoogleFonts.robotoSlab(textStyle: ktsSubheader),
          ),
        ),
        PersonalizedTextField(
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.name,
            controller: _nameController),
        PersonalizedTextField(
          textInputType: TextInputType.emailAddress,
          hintText: AppLocalizations.of(context)!.email,
          controller: _emailController,
        ),
        PersonalizedTextField(
            textInputType: TextInputType.visiblePassword,
            hintText: AppLocalizations.of(context)!.password,
            isPassword: true,
            controller: _passController),
        PersonalizedTextField(
            textInputType: TextInputType.visiblePassword,
            hintText: AppLocalizations.of(context)!.confirmPassword,
            isPassword: true,
            controller: _confirmPassController),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
                onPressed: () => signUp(context),
                child: Text(AppLocalizations.of(context)!.signUp),
                style: kbsButton)),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: MaterialButton(
            onPressed: () => {Navigator.pushNamed(context, 'login')},
            child: Text(AppLocalizations.of(context)!.alreadyAccount,
                style: TextStyle(color: kcPrimaryColor)),
          ),
        ),
      ],
    );
  }
}

void signUp(BuildContext context) async {
  if (_passController.text == _confirmPassController.text) {
    AuthenticationService _authentication = new AuthenticationService(context);
    String code = await _authentication.signUp(
        email: _emailController.text, password: _passController.text);
    var snackBar = SnackBar(content: Text(code));

    if (code == 'weak-password') {
      snackBar =
          SnackBar(content: Text(AppLocalizations.of(context)!.weakPassword));
    } else if (code == 'email-already-in-use') {
      snackBar =
          SnackBar(content: Text(AppLocalizations.of(context)!.accountExists));
    } else if (code == '') {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
