import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthMethods{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async
  {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      UserInfo user = result.user;
      return user==null?null:user.uid;
    }
    catch(e) {

    }
    return null;
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      UserInfo user = result.user;
      return user==null?null:user.uid;
    }
    catch (e) {
      //print(e);
    }
    return null;
  }

  Future resetPassword(String email) async {
    try {
      return await _firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch(e) {
      print(e);
    }
    return null;
  }

  Future signOut() async {
    try {
       return await _firebaseAuth.signOut();
    }
    catch (e) {
      print(e);
    }
  }
}
