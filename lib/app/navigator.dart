import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/pages/home/home_page.dart';
import 'package:persona_test/app/presentation/pages/main/main_page.dart';
import 'package:persona_test/app/presentation/pages/overtime/detail/overtime_detail_page.dart';
import 'package:persona_test/app/presentation/pages/overtime/detail_superior/overtime_detail_superior_page.dart';
import 'package:persona_test/app/presentation/pages/overtime/overtime_page.dart';
import 'package:persona_test/app/presentation/pages/overtime/request/overtime_request_page.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(
          builder: (BuildContext _) => LoginPage(),
        );
      case HomePage.route:
        return MaterialPageRoute(
          builder: (BuildContext _) => HomePage(),
        );
      case MainPage.route:
        return MaterialPageRoute(
          builder: (BuildContext _) => MainPage(),
        );
      case OvertimePage.route:
        return MaterialPageRoute(
          builder: (BuildContext _) => OvertimePage(),
        );
      case OvertimeRequestPage.route:
        return MaterialPageRoute(
          builder: (BuildContext _) => OvertimeRequestPage(),
        );
      case OvertimeDetailPage.route:
        final arguments = settings.arguments as int;
        return MaterialPageRoute(
          builder: (BuildContext _) => OvertimeDetailPage(arguments),
        );
      case OvertimeDetailSuperiorPage.route:
        final arguments = settings.arguments as int;
        return MaterialPageRoute(
          builder: (BuildContext _) => OvertimeDetailSuperiorPage(arguments),
        );
      default:
        return null;
    }
  }
}
