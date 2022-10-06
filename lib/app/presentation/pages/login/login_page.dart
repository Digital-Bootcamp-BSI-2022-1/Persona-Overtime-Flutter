import 'package:persona_test/app/presentation/pages/login/login_controller.dart';
import 'package:persona_test/app/presentation/widgets/popup_dialog_widget.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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

    return Stack(
      children: [
        Container(),
        Scaffold(
          key: globalKey,
          backgroundColor: kBackgroundWhite,
          body: ControlledWidgetBuilder<LoginController>(
            builder: (BuildContext _, LoginController controller) => controller.isLoading
                ? const Center(child: CupertinoActivityIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: deviceSize.height * 0.15),
                        Container(
                          width: deviceSize.width,
                          height: deviceSize.height * 0.2,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/login_logo.png'))),
                        ),
                        SizedBox(height: deviceSize.height * 0.05),
                        SizedBox(
                          width: deviceSize.width * 0.9,
                          child: TextField(
                            controller: controller.usernameCon,
                            decoration:
                                const InputDecoration(hintText: "Username", prefixIcon: Icon(Icons.person_outline)),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.02),
                        SizedBox(
                          width: deviceSize.width * 0.9,
                          child: TextField(
                            controller: controller.passwordCon,
                            obscureText: controller.passVisibility,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.vpn_key),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.changePassVisibility();
                                    },
                                    icon: controller.passVisibility
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility))),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.05),
                        SizedBox(
                            width: deviceSize.width * 0.85,
                            height: deviceSize.height * 0.06,
                            child: OutlinedButton(
                              onPressed: () {
                                if (controller.usernameCon.text.isNotEmpty && controller.passwordCon.text.isNotEmpty) {
                                  controller.showLoading();
                                  controller.postLogin(context);
                                } else if (controller.usernameCon.text.isEmpty &&
                                    controller.passwordCon.text.isNotEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => const WidgetPopupDialog(
                                      title: "Login Error",
                                      message: "Username submitted error",
                                    ),
                                  );
                                } else if (controller.usernameCon.text.isNotEmpty &&
                                    controller.passwordCon.text.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => const WidgetPopupDialog(
                                      title: "Login Error",
                                      message: "Password submitted error",
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => const WidgetPopupDialog(
                                      title: "Login Error",
                                      message: "Username & Password submitted error",
                                    ),
                                  );
                                }
                              },
                              style: OutlinedButton.styleFrom(backgroundColor: kPrimaryBlue),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryWhite),
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
}
