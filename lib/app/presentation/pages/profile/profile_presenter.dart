import 'package:persona_test/domain/entities/profile.dart';
import 'package:persona_test/use_case/cases/get_profile_use_case.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfilePresenter extends Presenter {
  late Function(Profile?) onSuccessGetProfile;
  late Function(dynamic error) onErrorGetProfile;
  late Function() onFinishGetProfile;

  final GetProfile getProfileUseCase;

  ProfilePresenter({required this.getProfileUseCase});

  void getProfile(String token) {
    getProfileUseCase.execute(_GetProfileObserver(this), ProfileParams(token));
  }

  @override
  void dispose() {
    getProfileUseCase.dispose();
  }
}

class _GetProfileObserver extends Observer<Profile> {
  final ProfilePresenter presenter;

  _GetProfileObserver(this.presenter);

  @override
  void onComplete() => presenter.onFinishGetProfile();

  @override
  void onError(e) => presenter.onErrorGetProfile(e);

  @override
  void onNext(Profile? response) {
    final profile = response;
    presenter.onSuccessGetProfile(profile);
  }
}
