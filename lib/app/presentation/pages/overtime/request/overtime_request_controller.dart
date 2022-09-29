import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OvertimeRequestController extends Controller {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Map<String, dynamic> _profileData = {};
  Map<String, dynamic> get profileData => _profileData;
  TextEditingController _dateStartCon = TextEditingController();
  TextEditingController get dateStartCon => _dateStartCon;
  TextEditingController _dateEndCon = TextEditingController();
  TextEditingController get dateEndCon => _dateEndCon;
  TextEditingController _timeStartCon = TextEditingController();
  TextEditingController get timeStartCon => _timeStartCon;
  TextEditingController _timeEndCon = TextEditingController();
  TextEditingController get timeEndCon => _timeEndCon;
  TextEditingController _remarksCon = TextEditingController();
  TextEditingController get remarksCon => _remarksCon;

  @override
  void initListeners() {
    // getProfile();
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

  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  void selectDate(BuildContext context, String text) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    print(text);
    if (selected != null) {
      text = formatDateOvertimeReq.format(selected);
    }
    print(selected);
    print(text);
    refreshUI();
  }

  void selectStartDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (selected != null) {
      _dateStartCon.text = formatDateOvertimeReq.format(selected);
    }
    refreshUI();
  }

  void selectEndDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (selected != null) {
      _dateEndCon.text = formatDateOvertimeReq.format(selected);
    }
    refreshUI();
  }

  void selectStartTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selected != null) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, selected.hour, selected.minute);
      _timeStartCon.text = formatTime.format(dt);
    }
    refreshUI();
  }

  void selectEndTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selected != null) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, selected.hour, selected.minute);
      _timeEndCon.text = formatTime.format(dt);
    }
    refreshUI();
  }
}
