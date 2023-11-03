import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/service/firebase_service.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController editingController = TextEditingController();
  final image = [
    'assets/slider/img2.jpeg',
    'assets/slider/img3.jpeg',
    'assets/slider/img4.jpeg',
  ];

  String? username;

  void setName(String uid) {
    FirebaseService().getUsername(uid).then((value) {
      username = value;
      notifyListeners();
    });
  }
}
