import 'package:flutter/cupertino.dart';
import 'package:persona_test/app/presentation/pages/overtime/overtime_page.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OvertimeDetailSuperiorController extends Controller {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
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
  String? _attachmentURL;
  String? get attachmentURL => _attachmentURL;
  String _dateRequested = "";
  String get dateRequested => _dateRequested;
  String _duration = "";
  String get duration => _duration;
  String _dateApproved = "";
  String get dateApproved => _dateApproved;
  String _dateCompleted = "";
  String get dateCompleted => _dateCompleted;
  String _status = "";
  String get status => _status;
  String _isCompleted = "";
  String get isCompleted => _isCompleted;
  String _requester = "";
  String get requester => _requester;

  final dio = Dio();

  @override
  void initListeners() {
    getOvertimeDetail();
  }

  void navigateToOvertime() {
    final context = getContext();
    Navigator.pushReplacementNamed(context, OvertimePage.route);
  }

  void getOvertimeDetail() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? tokenGlobal = prefs.getString('token');
    final int? idDetailOT = prefs.getInt('idDetailOT');
    var responseGetOvertimeDetail = await Dio().get(
        'https://persona-overtime.herokuapp.com/overtime/superior/$idDetailOT',
        options: Options(headers: {"Authorization": "Bearer $tokenGlobal"}));
    _dateStartCon.text = formatDateOvertimeReq.format(DateTime.parse(responseGetOvertimeDetail.data[0]["start_date"]));
    _dateEndCon.text = formatDateOvertimeReq.format(DateTime.parse(responseGetOvertimeDetail.data[0]["end_date"]));
    _timeStartCon.text = responseGetOvertimeDetail.data[0]["start_time"];
    _timeEndCon.text = responseGetOvertimeDetail.data[0]["end_time"];
    _attachmentURL = responseGetOvertimeDetail.data[0]["attachment"];
    _remarksCon.text = responseGetOvertimeDetail.data[0]["remarks"];
    _dateEndCon.text = formatDateOvertimeReq.format(DateTime.parse(responseGetOvertimeDetail.data[0]["end_date"]));
    _dateEndCon.text = formatDateOvertimeReq.format(DateTime.parse(responseGetOvertimeDetail.data[0]["end_date"]));
    _dateRequested = formatDateOvertimeReq.format(DateTime.parse(responseGetOvertimeDetail.data[0]["request_date"]));
    _duration = responseGetOvertimeDetail.data[0]["duration"].toString();
    _dateApproved = formatDateOvertimeReq.format(DateTime.parse(responseGetOvertimeDetail.data[0]["approved_date"]));
    _dateCompleted = formatDateOvertimeReq.format(DateTime.parse(responseGetOvertimeDetail.data[0]["completed_date"]));
    _status = responseGetOvertimeDetail.data[0]["status"].toString();
    _isCompleted = responseGetOvertimeDetail.data[0]["is_completed"].toString();
    _requester = responseGetOvertimeDetail.data[0]["user"]["name"].toString();
    // print(responseGetOvertimeDetail.data[0]);
    hideLoading();
  }

  void postOvertimeUpdate(context, int statusUpdate) async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    final String? tokenGlobal = prefs.getString('token');
    final int? idDetailOT = prefs.getInt('idDetailOT');
    FormData formData = FormData.fromMap({
      'start_date': _dateStartCon.text,
      'end_date': _dateEndCon.text,
      'start_time': _timeStartCon.text,
      'end_time': _timeEndCon.text,
      'status': statusUpdate.toString(),
    });
    try {
      dio.interceptors.add(
        DioLoggingInterceptor(
          level: Level.body,
          compact: false,
        ),
      );
      var responseUpdateOvertime = await dio.post('https://persona-overtime.herokuapp.com/update/overtime/$idDetailOT',
          options: Options(headers: {"Authorization": "Bearer $tokenGlobal"}), data: formData);
      if (responseUpdateOvertime.statusCode! >= 200 && responseUpdateOvertime.statusCode! < 300) {
        // print("Update Success");
        Navigator.pop(context);
        navigateToOvertime();
      } else {
        // print("Update Failed");
      }
    } catch (e) {
      // print("Update Error");
      // Exception;
      // print(e);
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

  void viewPDFfromURL(context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (_) => PDFViewerFromUrl(
          url: url,
        ),
      ),
    );
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
        backgroundColor: kPrimaryDarkBlue,
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => const Center(child: CupertinoActivityIndicator()),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
