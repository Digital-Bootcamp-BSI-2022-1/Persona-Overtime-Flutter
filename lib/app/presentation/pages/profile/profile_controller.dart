import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:persona_test/app/presentation/pages/profile/profile_presenter.dart';
import 'package:persona_test/domain/entities/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfileController extends Controller {
  final ProfilePresenter _presenter;

  ProfileController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Map<String, dynamic> _profileData = {};
  Map<String, dynamic> get profileData => _profileData;

  Profile? _profile;
  Profile? get users => _profile;

  @override
  void initListeners() {
    _initObserver();
    _getProfileCA();
    getProfile();
  }

  void _initObserver() {
    _presenter.onErrorGetProfile = (e) {};
    _presenter.onFinishGetProfile = () {
      hideLoading();
    };
    _presenter.onSuccessGetProfile = (Profile? data) {
      _profile = data;
      // print(_profile);
      // print("Success");
    };
  }

  void navigateToLogin() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, LoginPage.route);
  }

  void getProfile() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? nikSP = prefs.getString('nik');
    if (nikSP == null) {
      final String? tokenGlobal = prefs.getString('token');
      try {
        var responseGetProfile = await Dio().get('https://persona-overtime.herokuapp.com/profile',
            options: Options(headers: {"Authorization": "Bearer $tokenGlobal"}));
        prefs.setString('name', responseGetProfile.data['name']);
        prefs.setString('nik', responseGetProfile.data['nik']);
        prefs.setString('role', responseGetProfile.data['role']);
        prefs.setString('grade', responseGetProfile.data['grade']);
        prefs.setString('employment_status', responseGetProfile.data['employment_status']);
        prefs.setString('phone', responseGetProfile.data['phone']);
        prefs.setString('email', responseGetProfile.data['email']);
        prefs.setString('ktp', responseGetProfile.data['ktp']);
        prefs.setString('npwp', responseGetProfile.data['npwp']);
        prefs.setString('join_date', responseGetProfile.data['join_date']);
        _profileData = responseGetProfile.data;
      } catch (e) {
        // print(e);
        if (e is DioError) {
          // print(e.response?.data);
        }
      }
    }
    if (nikSP != null) {
      final String? nameSP = prefs.getString('name');
      final String? roleSP = prefs.getString('role');
      final String? gradeSP = prefs.getString('grade');
      final String? employmentStatusSP = prefs.getString('employment_status');
      final String? phoneSP = prefs.getString('phone');
      final String? emailSP = prefs.getString('email');
      final String? ktpSP = prefs.getString('ktp');
      final String? npwpSP = prefs.getString('npwp');
      final String? joinDateSP = prefs.getString('join_date');
      _profileData['nik'] = nikSP;
      _profileData['name'] = nameSP;
      _profileData['role'] = roleSP;
      _profileData['grade'] = gradeSP;
      _profileData['employment_status'] = employmentStatusSP;
      _profileData['phone'] = phoneSP;
      _profileData['email'] = emailSP;
      _profileData['ktp'] = ktpSP;
      _profileData['npwp'] = npwpSP;
      _profileData['join_date'] = joinDateSP;
    }
    hideLoading();
  }

  void _getProfileCA() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? tokenGlobal = prefs.getString('token');
    // print(_profile);
    _presenter.getProfile(tokenGlobal!);
    // print(_profile);
  }

  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }
}
