import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/view/screen/loginscreen.dart';
import 'package:gumsmile_dental_care/view/widgets/navbar_widget.dart';

class AuthLogin extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    if (_firebaseAuth.currentUser != null) {
      return NavigationBarWidget();
    } else {
      return ScreenLogin();
    }
  }
}
