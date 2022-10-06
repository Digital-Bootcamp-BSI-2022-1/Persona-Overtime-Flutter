import 'dart:async';

import 'package:persona_test/data/repos/profile_repo.dart';
import 'package:persona_test/domain/entities/profile.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetProfile extends UseCase<Profile, ProfileParams> {
  final ProfileRepository repository;

  GetProfile(this.repository);

  @override
  Future<Stream<Profile>> buildUseCaseStream(ProfileParams? params) async {
    final streamController = StreamController<Profile>();

    try {
      final profile = await repository.profile(params!.token);
      streamController.add(profile);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}

class ProfileParams {
  final String token;

  ProfileParams(this.token);
}
