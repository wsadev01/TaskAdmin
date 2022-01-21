import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User?> _firebaseUser = Rx<User?>(null);

  String get user => _firebaseUser.value?.email ?? "";

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  signIn(String email, String password){
    try{
      Future<UserCredential> userCredential = _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch(e) {
      print("[!] An exception occurred on file auth_controller.dart:17. ");
      e.printError();
    }
  }

  signUp(String email, String password) {
    try {
      Future<UserCredential> userCredential = _auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("[!!] asusenas");
      if (e.code == 'weak-password') {
        print('[+] The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('[!] The account already exists for that email.');
      } else if (e.code == 'email-invalid') {
        print('[!] Invalid e-mail format.');
      }
    } catch (e) {
      print("[!] An exception occurred on file auth_controller.dart:17. ");
      //e.printError();
    }
  }
}
