import 'package:persona_test/data/misc/endpoints.dart';
import 'package:persona_test/domain/entities/profile.dart';
import 'package:dio/dio.dart';

abstract class ProfileRepository {
  Future<Profile> profile(String token);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final Endpoints endpoints;
  final Dio dio;

  ProfileRepositoryImpl({required this.endpoints, required this.dio});

  @override
  Future<Profile> profile(String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.get(endpoints.profiles);
      final usersResponse = response.data as Profile;
      return usersResponse;
    } catch (e) {
      rethrow;
    }
  }
}
