import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/main.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lart/ui/widgets/textField_widget.dart';
import 'package:lart/Data/Repositories/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String _emailError = '';
  String _passError = '';

  bool _isLoading = false;

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
      body: _isLoading
          ? Loading()
          : ListView(
              padding: EdgeInsets.only(bottom: 20),
              children: [
                Container(
                    child: Image.asset('assets/design/login-woman-pexels.png',
                        fit: BoxFit.fitWidth)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(AppLocalizations.of(context)!.login,
                            style: GoogleFonts.robotoSlab(
                                textStyle: ktsSubheader)),
                      ),
                      PersonalizedTextField(
                        textInputType: TextInputType.emailAddress,
                        hintText: AppLocalizations.of(context)!.email,
                        controller: _emailController,
                        errorText:
                            _emailError.isNotEmpty ? _emailError : null,
                      ),
                      PersonalizedTextField(
                        textInputType: TextInputType.visiblePassword,
                        hintText: AppLocalizations.of(context)!.password,
                        isPassword: true,
                        controller: _passwordController,
                        errorText: _passError.isNotEmpty ? _passError : null,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                _isLoading = true;
                                setState(() {});
                                await logIn();
                                _isLoading = false;
                                setState(() {});
                              },
                              child: Text(AppLocalizations.of(context)!.login),
                              style: kbsButton)),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'forgotPassword');
                          },
                          child: Text(
                              AppLocalizations.of(context)!.forgotPassword,
                              style: TextStyle(
                                  color: Color.fromRGBO(24, 212, 124, 1.0))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> logIn() async {
    if (_emailController.text.isEmpty)
      _emailError = AppLocalizations.of(context)!.fieldRequired;
    else
      _emailError = '';

    if (_passwordController.text.isEmpty)
      _passError = AppLocalizations.of(context)!.fieldRequired;
    else
      _passError = '';

    if(_emailError.isEmpty && _emailError.isEmpty){
      AuthenticationService _authentication = Get.find();
      String code = await _authentication.login(
          email: _emailController.text, password: _passwordController.text);

      if (code == 'user-not-found') {
        _emailError = AppLocalizations.of(context)!.noUserFound;
      } else
        _emailError = '';
      if (code == 'wrong-password') {
        _passError = AppLocalizations.of(context)!.wrondPassword;
      } else
        _passError = '';
      if (code == 'network-request-failed') {
        Get.snackbar('Error', 'Error de red');
      }
      if (code == '') {
        return;
      }

    }
  }
}
