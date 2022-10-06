import 'package:persona_test/data/misc/constant.dart';
import 'package:persona_test/data/misc/endpoints.dart';
import 'package:persona_test/data/misc/logging_interceptor.dart';
import 'package:persona_test/data/repos/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injector/injector.dart';

class DataModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerSingleton<Endpoints>(() => Endpoints());
    injector.registerDependency<Dio>(() {
      final dio = Dio();
      dio.options.baseUrl = baseUrl;
      dio.options.sendTimeout = 30 * 1000;
      dio.options.connectTimeout = 30 * 1000;
      dio.options.receiveTimeout = 30 * 1000;

      if (kDebugMode) dio.interceptors.add(LoggingInterceptor());

      return dio;
    });
    injector.registerDependency<ProfileRepository>(
      () => ProfileRepositoryImpl(endpoints: injector.get(), dio: injector.get()),
    );
  }
}
