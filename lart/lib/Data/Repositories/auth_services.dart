import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:lart/ui/utils/navigation_service.dart';
import 'package:get/get.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final BuildContext context;

  AuthenticationService(this.context) {
    _firebaseAuth.idTokenChanges().listen((User? user) {
      String currentRoute = Get.currentRoute;
      if (user == null) {
        print('User is currently signed out!');

        if (currentRoute != 'signup')
          NavigationService.instance.navigateTo('signup');
      } else {
        print('User is signed in!');
        if (currentRoute != 'homePage')
          NavigationService.instance.navigateToAndDeletePrevious('homePage');
      }
    });
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
    return '';
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return '';
  }
}
