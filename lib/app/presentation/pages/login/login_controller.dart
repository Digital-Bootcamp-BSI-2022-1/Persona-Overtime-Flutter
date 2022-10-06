import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:persona_test/app/presentation/widgets/popup_dialog_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginController extends Controller {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  TextEditingController _usernameCon = TextEditingController();
  TextEditingController get usernameCon => _usernameCon;
  TextEditingController _passwordCon = TextEditingController();
  TextEditingController get passwordCon => _passwordCon;
  bool _passVisibility = true;
  bool get passVisibility => _passVisibility;

  final dio = Dio();

  @override
  void initListeners() {
    checkToken();
  }

  void navigateToMain() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, MainPage.route);
  }

  void navigateToLogin() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, LoginPage.route);
  }

  void postLogin(context) async {
    showLoading();
    try {
      dio.interceptors.add(
        DioLoggingInterceptor(
          level: Level.body,
          compact: false,
        ),
      );
      var responseLogin = await dio.post('https://persona-overtime.herokuapp.com/auth/login',
          data: {"nik": _usernameCon.text, "password": _passwordCon.text});
      if (responseLogin.statusCode! >= 200 && responseLogin.statusCode! < 300) {
        // print("Post Success");
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', responseLogin.data['token']);
        await prefs.setString('name', responseLogin.data['name']);
        navigateToMain();
      } else {
        // print("Post Failed");
        showDialog(
          context: context,
          builder: (BuildContext context) => const WidgetPopupDialog(
            title: "Login Error",
            message: "Data Submitted Error",
          ),
        );
        hideLoading();
      }
    } catch (e) {
      // print("Post Error");
      Exception;
      if (e is DioError) {
        // print(e.response?.data);
        showDialog(
          context: context,
          builder: (BuildContext context) => WidgetPopupDialog(
            title: "Login Error",
            message: e.response?.data["message"],
          ),
        );
        hideLoading();
      } else {
        // print(e);
        showDialog(
          context: context,
          builder: (BuildContext context) => const WidgetPopupDialog(
            title: "Login Error",
            message: "Data Submitted Error",
          ),
        );
        hideLoading();
      }
    }
  }

  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void hideLoading() {
    _isLoading = false;
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

  void changePassVisibility() {
    _passVisibility = !_passVisibility;
    refreshUI();
  }
}
