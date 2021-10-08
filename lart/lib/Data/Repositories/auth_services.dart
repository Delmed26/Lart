import 'package:firebase_auth/firebase_auth.dart';
import 'package:lart/ui/utils/navigation_service.dart';
import 'package:get/get.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  createFirebaseAuth() {
    _firebaseAuth.idTokenChanges().listen((User? user) {
      String currentRoute = Get.currentRoute;
      if (user == null) {
        print('User is currently signed out!');

        if (currentRoute != 'signup' &&
            currentRoute != 'login' &&
            currentRoute != 'forgotPassword') {
          NavigationService.instance.navigateToAndDeletePrevious('signup');
        }
      } else {
        print('User is signed in!');
        if (currentRoute == 'signup' ||
            currentRoute == 'login' ||
            currentRoute == 'forgotPassword')
          NavigationService.instance.navigateToAndDeletePrevious('homePage');
      }
    });
  }

  String getInitialRoute() {
    if (_firebaseAuth.currentUser != null) {
      return 'homePage';
    } else
      return 'signup';
  }

  Future<String> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
    return '';
  }

  Future<String> signUp(
      {required String email, required String password, required String username}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      }
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
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return '';
  }
}
