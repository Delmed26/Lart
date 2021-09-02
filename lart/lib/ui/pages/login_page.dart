import 'package:flutter/material.dart';
import 'package:lart/ui/widgets/textField_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/design/Lart.png',
              height: 100,
            ),
            Text(AppLocalizations.of(context)!.createAccount),
            PersonalizedTextField()
          ],
        ),
      ),
    );
  }
}
