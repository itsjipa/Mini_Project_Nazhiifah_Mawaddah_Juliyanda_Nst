import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/service/firebase_service.dart';

class LoginProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;

  Future<bool> checkLogin(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoading = true;
      notifyListeners();

      try {
        final user = await FirebaseService().logIn(email, password);
        _isLoading = false;
        notifyListeners();

        return user != null;
      } catch (e) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } else {
      return false;
    }
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please input your password";
    } else if (value.length < 8) {
      return "Enter min. 8 characters";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Must have one uppercase letter";
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return "Must have one lowercase letter";
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Must have one special character";
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email address";
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(value)) {
      return "Please enter a valid email address";
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }
}
