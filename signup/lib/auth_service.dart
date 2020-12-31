import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/homepage.dart';
import 'loginpage.dart';


class AuthService {

  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      // ignore: deprecated_member_use
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return HomePage();
        }
        else{
          return LoginPage();
        }
      },
    );
  }
  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
  //Sign In
  signIn(email, password) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((user) {
      print('Signd In');
    }).catchError((e) {
      print(e);
   });
  }
}