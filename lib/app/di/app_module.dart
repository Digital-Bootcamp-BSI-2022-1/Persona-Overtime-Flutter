import 'package:persona_test/app/navigator.dart';
import 'package:injector/injector.dart';

class AppModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerSingleton<AppNavigator>(() => AppNavigator());
  }

  static init() {
    registerClasses();
  }
}
