import 'package:flutter/material.dart';
import 'package:lart/Data/Repositories/ad_state.dart';
import 'package:lart/ui/pages/account/forgotPassword_page.dart';
import 'package:lart/ui/pages/account/login_page.dart';
import 'package:lart/ui/pages/account/signup_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lart/ui/pages/home/home_page.dart';
import 'package:lart/ui/pages/list/listItems_page.dart';
import 'package:lart/ui/shared/styles.dart';
import 'package:lart/ui/utils/navigation_service.dart';
import 'package:lart/ui/widgets/loading_widget.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'Data/Repositories/auth_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(
      value: adState,
      builder: (context, child) => App(),
    )
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) return SomethingWentWrong();

        if (snapshot.connectionState == ConnectionState.done) {
          // ignore: unused_local_variable
          AuthenticationService _auth = Get.put(AuthenticationService());
          return Lart();
        }

        return Loading();
      },
    );
  }
}

class Lart extends StatelessWidget {
  final AuthenticationService _auth = Get.find();

  @override
  Widget build(BuildContext context) {
    _auth.createFirebaseAuth();
    return GetMaterialApp(
      title: 'Lart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              secondary: kcSecondaryColor, primary: kcPrimaryColor),
          brightness: Brightness.light),
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: _auth.getInitialRoute(),
      routes: {
        'signup': (_) => SignupScreen(),
        'login': (_) => LoginScreen(),
        'forgotPassword': (_) => ForgotPasswordScreen(),
        'homePage': (_) => HomePage(),
        'listItems': (_) => ListItemsPage()
      },
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Center(child: LoadingWidget()),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Algo salio mal'),
        ),
      ),
    );
  }
}
