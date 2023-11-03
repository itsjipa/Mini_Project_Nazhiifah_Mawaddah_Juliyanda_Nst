import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/view/screen/home_screen.dart';
import 'package:gumsmile_dental_care/view/screen/message_screen.dart';
import 'package:gumsmile_dental_care/view/screen/profile_screen.dart';

class NavbarProvider extends ChangeNotifier {
  int _selectedIndex = 1;
  int get selectedIndex => _selectedIndex;

  final screen = const<Widget>[
    MessageScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
