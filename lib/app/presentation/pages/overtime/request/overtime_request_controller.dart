import 'package:persona_test/app/presentation/pages/overtime/overtime_page.dart';
import 'package:persona_test/app/presentation/pages/overtime/detail/overtime_detail_page.dart';
import 'package:persona_test/app/presentation/widgets/popup_dialog_widget.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _attachment;
  File? get attachment => _attachment;

  final dio = Dio();

  @override
  void initListeners() {
  }

  void navigateToOvertime() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, OvertimePage.route);
  }

  void navigateToDetail(int idOT) {
    final context = getContext();
    Navigator.pushReplacementNamed(context, OvertimeDetailPage.route, arguments: idOT);
  }

  void postOvertimeRequest(context) async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? tokenGlobal = prefs.getString('token');
    FormData formData = FormData.fromMap({
      'start_date': _dateStartCon.text,
      'end_date': _dateEndCon.text,
      'start_time': _timeStartCon.text,
      'end_time': _timeEndCon.text,
      'status': "1",
      'remarks': _remarksCon.text,
      'attachment': (_attachment != null) ? await MultipartFile.fromFile(_attachment!.path) : null
    });
    try {
      dio.interceptors.add(
        DioLoggingInterceptor(
          level: Level.body,
          compact: false,
        ),
      );
      var responseRequestOvertime = await dio.post('https://persona-overtime.herokuapp.com/overtime',
          options: Options(headers: {"Authorization": "Bearer $tokenGlobal"}), data: formData);
      if (responseRequestOvertime.statusCode! >= 200 && responseRequestOvertime.statusCode! < 300) {
        // print("Post Success");
        Navigator.pop(context);
        navigateToOvertime();
        showDialog(
          context: context,
          builder: (BuildContext context) => const WidgetPopupDialog(
            title: "Request Success",
            message: "Overtime data successfully added",
          ),
        );
      } else {
        // print("Post Failed");
        showDialog(
          context: context,
          builder: (BuildContext context) => const WidgetPopupDialog(
            title: "Request Error",
            message: "Data Submitted Error",
          ),
        );
        hideLoading();
      }
    } catch (e) {
      // print("Post Error");
      Exception;
      if (e is DioError) {
        // print(e.response);
        showDialog(
          context: context,
          builder: (BuildContext context) => WidgetPopupDialog(
            title: "Request Error",
            message: e.response?.data["message"],
          ),
        );
        hideLoading();
      } else {
        // print(e);
        showDialog(
          context: context,
          builder: (BuildContext context) => const WidgetPopupDialog(
            title: "Request Error",
            message: "Data Submitted Error",
          ),
        );
        hideLoading();
      }
    }
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
    // print(text);
    if (selected != null) {
      text = formatDateOvertimeReq.format(selected);
    }
    // print(selected);
    // print(text);
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

  void getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    if (pickedFile != null) {
      _attachment = File(pickedFile.path);
    }
    refreshUI();
  }

  void pickFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    if (pickedFile != null) {
      _attachment = File(pickedFile.path);
    }
    refreshUI();
  }

  void clearAttachment() {
    _attachment = null;
    refreshUI();
  }
}
