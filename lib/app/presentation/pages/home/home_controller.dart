import 'package:persona_test/app/presentation/pages/overtime/overtime_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _userData = "";
  String? get userData => _userData;

  @override
  void initListeners() {
    getUser();
  }

  void navigateToOvertime() {
    final context = getContext();
    Navigator.pushNamed(context, OvertimePage.route);
  }

  void getUser() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? userName = prefs.getString('name');
    _userData = userName;
    hideLoading();
  }

  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }
}
