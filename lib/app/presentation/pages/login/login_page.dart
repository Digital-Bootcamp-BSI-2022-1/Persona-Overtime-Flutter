import 'package:persona_test/app/presentation/pages/login/login_controller.dart';
import 'package:persona_test/app/presentation/pages/home/home_page.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPage extends View {
  static const route = '/login';

  LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _LoginViewState(LoginController());
  }
}

class _LoginViewState extends ViewState<LoginPage, LoginController> {
  _LoginViewState(super.controller);

  @override
  Widget get view {
    var deviceSize = MediaQuery.of(context).size;

    final dio = Dio();

    final TextEditingController usernameCon = TextEditingController();
    final TextEditingController passwordCon = TextEditingController();
    bool passVisibility = true;

    return Stack(
      children: [
        Container(),
        Scaffold(
          key: globalKey,
          backgroundColor: kBackgroundWhite,
          body: ControlledWidgetBuilder<LoginController>(
            builder: (BuildContext _, LoginController controller) => controller
                    .isLoading
                ? const Center(child: CupertinoActivityIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: deviceSize.height * 0.15),
                        Container(
                          width: deviceSize.width,
                          height: deviceSize.height * 0.2,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/login_logo.png'))),
                        ),
                        SizedBox(height: deviceSize.height * 0.05),
                        SizedBox(
                          width: deviceSize.width * 0.9,
                          child: TextField(
                            controller: usernameCon,
                            decoration: const InputDecoration(
                                hintText: "Username",
                                prefixIcon: Icon(Icons.person_outline)),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.02),
                        SizedBox(
                          width: deviceSize.width * 0.9,
                          child: TextField(
                            controller: passwordCon,
                            obscureText: passVisibility,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.vpn_key),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      passVisibility = !passVisibility;
                                      controller.refresh();
                                    },
                                    icon: passVisibility
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility))),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.05),
                        SizedBox(
                            width: deviceSize.width * 0.85,
                            height: deviceSize.height * 0.06,
                            child: OutlinedButton(
                              onPressed: () async {
                                // Navigator.pushReplacementNamed(
                                //     context, HomePage.route);
                                if (usernameCon.text.isNotEmpty &&
                                    passwordCon.text.isNotEmpty) {
                                  controller.showLoading();
                                  try {
                                    dio.interceptors.add(
                                      DioLoggingInterceptor(
                                        level: Level.body,
                                        compact: false,
                                      ),
                                    );
                                    var responseLogin = await dio.post(
                                        'https://persona-overtime.herokuapp.com/auth/login',
                                        data: {
                                          "nik": usernameCon.text,
                                          "password": passwordCon.text
                                        });
                                    if (responseLogin.statusCode! >= 200 &&
                                        responseLogin.statusCode! < 300) {
                                      print("Success");
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setString(
                                          'token', responseLogin.data['token']);
                                      await prefs.setString(
                                          'name', responseLogin.data['name']);

                                      controller.navigateToMain();
                                    } else {
                                      controller.hideLoading();
                                      print("Fail");
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            buildPopupDialog(context),
                                      );
                                    }
                                  } catch (e) {
                                    print("Fail catch");
                                    controller.hideLoading;
                                    controller.navigateToLogin();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          buildPopupDialog(context),
                                    );
                                    Exception;
                                    print(e);
                                  }
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        buildPopupDialog(context),
                                  );
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: kPrimaryBlue),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryWhite),
                              ),
                            )),
                        SizedBox(height: deviceSize.height * 0.345),
                      ],
                    ),
                  ),
          ),
        )
      ],
    );
  }

  Widget buildPopupDialog(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      title: Container(
        height: 50,
        width: 300,
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          // color: Color(0xFF242424)
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Login Failed',
                style: TextStyle(
                    color: kPrimaryGrey,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: IconButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       icon: const Icon(
            //         Icons.clear,
            //         color: Color(0xFFFFFFFF),
            //       )),
            // ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text(
            "The user name or password is incorrect.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14, color: kPrimaryGrey),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 20.0),
      actions: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            side: const BorderSide(width: 0.0, color: kPrimaryWhite),
            elevation: 0,
            // primary: const Color(0xFFCA000E),
            // backgroundColor: const Color(0xFFCA000E),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(
                color: kBackgroundBlue,
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),
        ),
      ],
      // actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    );
  }
}
