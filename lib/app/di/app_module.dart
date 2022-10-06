import 'package:persona_test/app/navigator.dart';
import 'package:injector/injector.dart';
import 'package:persona_test/app/presentation/pages/profile/profile_controller.dart';
import 'package:persona_test/app/presentation/pages/profile/profile_presenter.dart';
import 'package:persona_test/data/di/data_module.dart';
import 'package:persona_test/use_case/di/use_case_module.dart';

class AppModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerSingleton<AppNavigator>(() => AppNavigator());
    injector.registerDependency<ProfilePresenter>(
      () => ProfilePresenter(getProfileUseCase: injector.get()),
    );
    injector.registerDependency<ProfileController>(
      () => ProfileController(injector.get()),
    );
  }

  static init() {
    DataModule.registerClasses();
    UseCaseModule.registerClasses();
    registerClasses();
  }
}
