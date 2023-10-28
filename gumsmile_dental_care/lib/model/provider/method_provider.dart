import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/view/screen/loginscreen.dart';

class Methods {
  Future<User?> createAccount(
      String name, String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        print("Account created succesful");
        await firebaseFirestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .set({"name": name, "email": email, "status": "Unavailable"});
        return user;
      } else {
        print("Accout creation failed");
        return user;
      }
    } catch (e) {
      debugPrint('Hello : $e');
      return null;
    }
  }

  Future<User?> logIn(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        debugPrint("Login Success");
        return user;
      } else {
        debugPrint('Login Failed');
        return user;
      }
    } catch (e) {
      return null;
    }
  }

  Future logOut(BuildContext context) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      await firebaseAuth.signOut().then((value) {
        Navigator.pop(context);
      });
    } catch (e) {
      return null;
    }
  }
}
