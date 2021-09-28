import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lart/Data/Repositories/auth_services.dart';
import 'package:lart/main.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:lart/ui/widgets/textField_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

bool _isLoading = false;
AuthenticationService _auth = Get.find();

class SignupScreen extends StatefulWidget {
  SignupScreen(){
    _auth.createFirebaseAuth();

  }

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: screenSize.height > 800
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

bool _nameHasError = false;
bool _mailHasError = false;
bool _passHasError = false;
bool _confirmPassHasError = false;

String? _nameError;
String? _mailError;
String? _passError;
String? _confirmPassError;

class SignupLargeScreen extends StatefulWidget {
  SignupLargeScreen({Key? key}) : super(key: key);

  @override
  _SignupLargeScreenState createState() => _SignupLargeScreenState();
}

class _SignupLargeScreenState extends State<SignupLargeScreen> {
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : Column(
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
                controller: _nameController,
                errorText: _nameHasError ? _nameError : null,
              ),
              PersonalizedTextField(
                textInputType: TextInputType.emailAddress,
                hintText: AppLocalizations.of(context)!.email,
                controller: _emailController,
                errorText: _mailHasError ? _mailError : null,
              ),
              PersonalizedTextField(
                textInputType: TextInputType.visiblePassword,
                hintText: AppLocalizations.of(context)!.password,
                isPassword: true,
                controller: _passController,
                errorText: _passHasError ? _passError : null,
              ),
              PersonalizedTextField(
                textInputType: TextInputType.visiblePassword,
                hintText: AppLocalizations.of(context)!.confirmPassword,
                isPassword: true,
                controller: _confirmPassController,
                errorText: _confirmPassHasError ? _confirmPassError : null,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await signUp(context);
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: Text(AppLocalizations.of(context)!.signUp),
                      style: kbsButton)),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    onPressed: () => {Navigator.pushNamed(context, 'login')},
                    child: Text(AppLocalizations.of(context)!.alreadyAccount,
                        style: TextStyle(
                            color: Color.fromRGBO(24, 212, 124, 1.0))),
                  ),
                ),
              ),
            ],
          );
  }
}

class SignupSmallScreen extends StatefulWidget {
  SignupSmallScreen({Key? key}) : super(key: key);

  @override
  _SignupSmallScreenState createState() => _SignupSmallScreenState();
}

class _SignupSmallScreenState extends State<SignupSmallScreen> {
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : ListView(
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
                controller: _nameController,
                errorText: _nameHasError ? _nameError : null,
              ),
              PersonalizedTextField(
                textInputType: TextInputType.emailAddress,
                hintText: AppLocalizations.of(context)!.email,
                controller: _emailController,
                errorText: _mailHasError ? _mailError : null,
              ),
              PersonalizedTextField(
                textInputType: TextInputType.visiblePassword,
                hintText: AppLocalizations.of(context)!.password,
                isPassword: true,
                controller: _passController,
                errorText: _passHasError ? _passError : null,
              ),
              PersonalizedTextField(
                textInputType: TextInputType.visiblePassword,
                hintText: AppLocalizations.of(context)!.confirmPassword,
                isPassword: true,
                controller: _confirmPassController,
                errorText: _confirmPassHasError ? _confirmPassError : null,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await signUp(context);
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: Text(AppLocalizations.of(context)!.signUp),
                      style: kbsButton)),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: MaterialButton(
                  onPressed: () => {Navigator.pushNamed(context, 'login')},
                  child: Text(AppLocalizations.of(context)!.alreadyAccount,
                      style: TextStyle(color: kcPrimaryColor)),
                ),
              )
            ],
          );
  }
}

Future<void> signUp(BuildContext context) async {
  if (_nameController.text == '') {
    _nameError = AppLocalizations.of(context)!.fieldRequired;
    _nameHasError = true;
  } else
    _nameHasError = false;
  if (_emailController.text == '') {
    _mailError = AppLocalizations.of(context)!.fieldRequired;
    _mailHasError = true;
  } else
    _mailHasError = false;
  if (_passController.text == '') {
    _passError = AppLocalizations.of(context)!.fieldRequired;
    _passHasError = true;
  } else
    _passHasError = false;
  if (_confirmPassController.text == '') {
    _confirmPassError = AppLocalizations.of(context)!.fieldRequired;
    _confirmPassHasError = true;
  } else
    _confirmPassHasError = false;

  if (!_nameHasError &&
      !_mailHasError &&
      !_passHasError &&
      !_confirmPassHasError) {
    if (_passController.text == _confirmPassController.text) {
      AuthenticationService _authentication = Get.find();
      String code = await _authentication.signUp(
          email: _emailController.text, password: _passController.text);

      if (code == 'weak-password') {
        _passError = AppLocalizations.of(context)!.weakPassword;
        _passHasError = true;
      } else
        _passHasError = false;
      if (code == 'email-already-in-use') {
        _mailError = AppLocalizations.of(context)!.accountExists;
        _mailHasError = true;
      } else
        _mailHasError = false;
      if (code == 'network-request-failed') {
        Get.snackbar('Error', 'Error de red');
      }
    } else {
      _confirmPassError = AppLocalizations.of(context)!.passwordDontMatch;
      _confirmPassHasError = true;
    }
  }
}
