import 'package:persona_test/app/di/app_module.dart';
import 'package:persona_test/app/navigator.dart';
import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:persona_test/app/utils/constants.dart';

void main() {
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appNavigator = Injector.appInstance.get<AppNavigator>();

    return MaterialApp(
      title: 'Persona',
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: kPrimaryBlue),
      home: LoginPage(),
      onGenerateRoute: appNavigator.onGenerateRoutes,
    );
  }
}
