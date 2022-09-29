import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/pages/overtime/request/overtime_request_page.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OvertimeController extends Controller {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Map<String, dynamic> _profileData = {};
  Map<String, dynamic> get profileData => _profileData;
  List<dynamic>? _overtimeData;
  List<dynamic>? get overtimeData => _overtimeData;
  List<dynamic> _overtimeDataSubmission = [];
  List<dynamic> get overtimeDataSubmission => _overtimeDataSubmission;
  List<dynamic> _overtimeDataHistory = [];
  List<dynamic> get overtimeDataHistory => _overtimeDataHistory;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  @override
  void initListeners() {
    getOvertime();
    // getProfile();
  }

  void navigateToLogin() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, LoginPage.route);
  }

  void navigateToOvertimeRequest() {
    final context = getContext();
    Navigator.pushNamed(context, OvertimeRequestPage.route);
  }

  void getProfile() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? nikSP = prefs.getString('nik');
    if (nikSP == null) {
      final String? tokenGlobal = prefs.getString('token');
      var responseGetProfile = await Dio().get(
          'https://persona-overtime.herokuapp.com/profile',
          options: Options(headers: {"Authorization": "Bearer $tokenGlobal"}));
      prefs.setString('name', responseGetProfile.data['name']);
      prefs.setString('nik', responseGetProfile.data['nik']);
      prefs.setString('role', responseGetProfile.data['role']);
      prefs.setString('grade', responseGetProfile.data['grade']);
      prefs.setString(
          'employment_status', responseGetProfile.data['employment_status']);
      prefs.setString('phone', responseGetProfile.data['phone']);
      prefs.setString('email', responseGetProfile.data['email']);
      prefs.setString('ktp', responseGetProfile.data['ktp']);
      prefs.setString('npwp', responseGetProfile.data['npwp']);
      prefs.setString('join_date', responseGetProfile.data['join_date']);
      _profileData = responseGetProfile.data;
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

  void getOvertime() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? tokenGlobal = prefs.getString('token');
    var responseGetOvertime = await Dio().get(
        'https://persona-overtime.herokuapp.com/overtime',
        options: Options(headers: {"Authorization": "Bearer $tokenGlobal"}));
    _overtimeData = responseGetOvertime.data;
    for (int i = 0; i < _overtimeData!.length; i++) {
      if (_overtimeData?[i]["status"] == 1 ||
          _overtimeData?[i]["status"] == 2 ||
          _overtimeData?[i]["status"] == 4 ||
          _overtimeData?[i]["status"] == 5) {
        _overtimeDataSubmission?.add(_overtimeData?[i]);
        print(_overtimeDataSubmission);
      }
      if (_overtimeData?[i]["status"] == 3 ||
          _overtimeData?[i]["status"] == 6 ||
          _overtimeData?[i]["status"] == 9) {
        _overtimeDataHistory?.add(_overtimeData?[i]);
        print(_overtimeDataHistory);
      }
    }
    hideLoading();
  }

  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  void showSumbission() {
    _selectedIndex = 0;
    refreshUI();
  }

  void showHistory() {
    _selectedIndex = 1;
    refreshUI();
  }
}
