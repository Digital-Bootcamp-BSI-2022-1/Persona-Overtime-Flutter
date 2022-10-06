import 'package:persona_test/use_case/cases/get_profile_use_case.dart';
import 'package:injector/injector.dart';

class UseCaseModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency<GetProfile>(() => GetProfile(injector.get()));
  }
}