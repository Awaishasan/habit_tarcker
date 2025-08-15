import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/configuration/approuter.dart';
import 'package:provider_practice/model/user_model.dart';

class FirebaseService {





  String message = "";
  final Auth = FirebaseAuth.instance;
   final firestore = FirebaseFirestore.instance;

  Future<User?> createUserEmailandPassword(
      String email, String password) async {
    try {
      final credential = await Auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        message = 'InValid Email and Password ';
      } else {
        message = e.code;
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Falied $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
    return null;
  }

  Future<User?> loginWithEmailandPassword(String email, String password) async {
    try {
      final credential = await Auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        message = " invalid Email and Password";
      } else {
        message = e.code;
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      print("Error while login");
    }

    return null;
  }

  Future<UserCredential?>  googleSignin()async{
    final GoogleSignIn  googleSignIn= GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken:  googleAuth.idToken,
    );

    final UserCredential userCredential = await Auth.signInWithCredential(credential);
    return null;


  }









  Future<void> storeUserData (UserModel User) async{
    try{
      await  firestore.collection('user').doc(User.uid).set(User.toMap());
      log("Data store successfully" as num);
    }catch(e){
      print("Failed to store data");

    }


  }

}
