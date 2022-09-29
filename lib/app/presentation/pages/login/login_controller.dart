import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/pages/home/home_page.dart';
import 'package:persona_test/app/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginController extends Controller {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void initListeners() {
    checkToken();
  }

  void navigateToMain() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, MainPage.route);
  }

  void navigateToHome() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, HomePage.route);
  }

  void navigateToLogin() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, LoginPage.route);
  }

  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  void refresh() {
    refreshUI();
  }

  void checkToken() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? tokenSP = prefs.getString('token');
    if (tokenSP != null) {
      navigateToMain();
    }
    if (tokenSP == null) {
      hideLoading();
    }
  }
}
