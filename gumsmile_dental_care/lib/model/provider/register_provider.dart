import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/provider/method_provider.dart';

class RegisterProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  get formKey => _formKey;

  bool isLoading = false;

  Future<User?> checkRegister(
      String name, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      User? user = await Methods().createAccount(name, email, password);

      if (user != null) {
        debugPrint("Account created succesful");
        isLoading = false;
        notifyListeners();
        return user;
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    } catch (e) {
      debugPrint('Error $e');
      isLoading = false;
      notifyListeners();
      return null;
    }
  }

  String? validatorName(String? value) {
    if (value != null && value.length < 5) {
      return "Enter at least 5 characters";
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email address";
    } else if (!value.contains("@") || !value.contains(".")) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 8) {
      return "Length of password's characters must be 8 or greater";
    }
    return null;
  }

  String? validatorPasswordCheck(String? value) {
    if (value == null || value.isEmpty) {
      return "Please re-enter your password";
    } else if (value.length < 8) {
      return "Length of password's characters must be 8 or greater";
    } else if (value != _passwordController.text) {
      return "Password mismatch";
    }
    return null;
  }
}
