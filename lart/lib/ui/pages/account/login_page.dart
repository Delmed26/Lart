import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lart/ui/widgets/textField_widget.dart';
import 'package:lart/Data/Repositories/auth_services.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kcPrimaryColor),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
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
                  hintText: AppLocalizations.of(context)!.email,
                  controller: _emailController,
                ),
                PersonalizedTextField(
                  textInputType: TextInputType.visiblePassword,
                  hintText: AppLocalizations.of(context)!.password,
                  isPassword: true,
                  controller: _passwordController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () => logIn(context),
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
    );
  }


  void logIn(BuildContext context) async {
    AuthenticationService _authentication = new AuthenticationService(context);
    String code = await _authentication.login(
        email: _emailController.text, password: _passwordController.text);
    var snackBar = SnackBar(content: Text(code));

    if (code == 'user-not-found') {
      snackBar =
        SnackBar(content: Text(AppLocalizations.of(context)!.noUserFound));
    } else if (code == 'wrong-password') { 
      snackBar =
        SnackBar(content: Text(AppLocalizations.of(context)!.wrondPassword));
    } else if (code == '') {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

