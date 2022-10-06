import 'package:flutter/material.dart';
import 'package:persona_test/app/presentation/pages/overtime/detail/overtime_detail_page.dart';
import 'package:persona_test/app/presentation/pages/overtime/detail_superior/overtime_detail_superior_page.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetOvertimeTileHistory extends StatelessWidget {
  final String start_date;
  final String start_time;
  final String end_time;
  final int duration;
  final int status;
  final String status_text;
  final int idOvertime;

  const WidgetOvertimeTileHistory({
    super.key,
    required this.start_date,
    required this.start_time,
    required this.end_time,
    required this.duration,
    required this.status,
    required this.status_text,
    required this.idOvertime,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return TextButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('idDetailOT', idOvertime);
          Navigator.pushNamed(context, OvertimeDetailPage.route, arguments: idOvertime);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
            elevation: MaterialStateProperty.all(1),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        child: SizedBox(
          width: deviceSize.width * 0.9,
          height: deviceSize.height * 0.14,
          child: Column(
            children: [
              Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.04,
                decoration: BoxDecoration(
                    color: MaterialStateColor.resolveWith((states) {
                      if (status == 1 || status == 4) {
                        return kPrimaryYellow;
                      }
                      if (status == 2 || status == 5) {
                        return kPrimaryBlue;
                      }
                      if (status == 6) {
                        return kPrimaryGreen;
                      }
                      if (status == 3 || status == 9) {
                        return kPrimaryRed;
                      }
                      return kPrimaryGrey;
                    }),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                child: Center(
                  child: Text(status_text, style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: deviceSize.width * 0.15,
                      child: Container(
                          height: deviceSize.width * 0.15,
                          width: deviceSize.width * 0.15,
                          decoration: const BoxDecoration(
                            color: kBackgroundBlue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(formatDatedd.format(DateTime.parse(start_date)),
                                  style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                              Text(
                                formatDateLLL.format(DateTime.parse(start_date)),
                                style: const TextStyle(color: kPrimaryWhite),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.03,
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Start Time",
                              style: TextStyle(color: kPrimaryPurple, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(start_time.substring(0, 8), style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("End Time", style: TextStyle(color: kPrimaryYellow, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(end_time.substring(0, 8), style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Duration", style: TextStyle(color: kPrimaryBlack, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(("${duration.toString()} Hours"), style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class WidgetOvertimeTileSubmission extends StatelessWidget {
  final String start_date;
  final String start_time;
  final String end_time;
  final int status;
  final String status_text;
  final String request_date;
  final int idOvertime;

  const WidgetOvertimeTileSubmission({
    super.key,
    required this.start_date,
    required this.start_time,
    required this.end_time,
    required this.status,
    required this.status_text,
    required this.request_date,
    required this.idOvertime,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return TextButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('idDetailOT', idOvertime);
          Navigator.pushNamed(context, OvertimeDetailPage.route, arguments: idOvertime);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
            foregroundColor: MaterialStateProperty.all(kPrimaryBlack),
            elevation: MaterialStateProperty.all(1),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        child: SizedBox(
          width: deviceSize.width * 0.9,
          height: deviceSize.height * 0.14,
          child: Column(
            children: [
              Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.04,
                decoration: BoxDecoration(
                    color: MaterialStateColor.resolveWith((states) {
                      if (status == 1 || status == 4) {
                        return kPrimaryYellow;
                      }
                      if (status == 2 || status == 5) {
                        return kPrimaryBlue;
                      }
                      if (status == 6) {
                        return kPrimaryGreen;
                      }
                      if (status == 3 || status == 9) {
                        return kPrimaryRed;
                      }
                      return kPrimaryGrey;
                    }),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                child: Center(
                  child: Text(status_text, style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: deviceSize.width * 0.15,
                      child: Container(
                          height: deviceSize.width * 0.15,
                          width: deviceSize.width * 0.15,
                          decoration: const BoxDecoration(
                            color: kBackgroundBlue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(formatDatedd.format(DateTime.parse(start_date)),
                                  style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                              Text(
                                formatDateLLL.format(DateTime.parse(start_date)),
                                style: const TextStyle(color: kPrimaryWhite),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.03,
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(start_time.substring(0, 8)),
                              const Text(" - "),
                              Text(end_time.substring(0, 8)),
                            ],
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(
                            "Submission Date : ${formatDateMdy.format(DateTime.parse(request_date))}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class WidgetOvertimeTileSubmissionSuperior extends StatelessWidget {
  final String start_date;
  final String start_time;
  final String end_time;
  final int status;
  final String status_text;
  final String request_date;
  final int idOvertime;
  final String requester_name;

  const WidgetOvertimeTileSubmissionSuperior({
    super.key,
    required this.start_date,
    required this.start_time,
    required this.end_time,
    required this.status,
    required this.status_text,
    required this.request_date,
    required this.idOvertime,
    required this.requester_name,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return TextButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('idDetailOT', idOvertime);
          Navigator.pushNamed(context, OvertimeDetailSuperiorPage.route, arguments: idOvertime);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
            foregroundColor: MaterialStateProperty.all(kPrimaryBlack),
            elevation: MaterialStateProperty.all(1),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        child: SizedBox(
          width: deviceSize.width * 0.9,
          height: deviceSize.height * 0.2,
          child: Column(
            children: [
              Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.05,
                decoration: BoxDecoration(
                    color: MaterialStateColor.resolveWith((states) {
                      if (status == 1 || status == 4) {
                        return kPrimaryYellow;
                      }
                      if (status == 2 || status == 5) {
                        return kPrimaryBlue;
                      }
                      if (status == 6) {
                        return kPrimaryGreen;
                      }
                      if (status == 3 || status == 9) {
                        return kPrimaryRed;
                      }
                      return kPrimaryGrey;
                    }),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                child: Center(
                  child: Text(status_text, style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: deviceSize.width * 0.15,
                      child: Container(
                          height: deviceSize.width * 0.15,
                          width: deviceSize.width * 0.15,
                          decoration: const BoxDecoration(
                            color: kBackgroundBlue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(formatDatedd.format(DateTime.parse(start_date)),
                                  style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                              Text(
                                formatDateLLL.format(DateTime.parse(start_date)),
                                style: const TextStyle(color: kPrimaryWhite),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.03,
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(start_time.substring(0, 8)),
                              const Text(" - "),
                              Text(end_time.substring(0, 8)),
                            ],
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(
                            "Submission Date : ${formatDateMdy.format(DateTime.parse(request_date))}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.05,
                decoration: const BoxDecoration(
                    color: kPrimaryWhite,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                child: Center(
                  child:
                      Text(requester_name, style: const TextStyle(color: kPrimaryBlack, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ));
  }
}

class WidgetOvertimeTileHistorySuperior extends StatelessWidget {
  final String start_date;
  final String start_time;
  final String end_time;
  final int duration;
  final int status;
  final String status_text;
  final int idOvertime;
  final String requester_name;

  const WidgetOvertimeTileHistorySuperior({
    super.key,
    required this.start_date,
    required this.start_time,
    required this.end_time,
    required this.duration,
    required this.status,
    required this.status_text,
    required this.idOvertime,
    required this.requester_name,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return TextButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('idDetailOT', idOvertime);
          Navigator.pushNamed(context, OvertimeDetailSuperiorPage.route, arguments: idOvertime);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
            elevation: MaterialStateProperty.all(1),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        child: SizedBox(
          width: deviceSize.width * 0.9,
          height: deviceSize.height * 0.2,
          child: Column(
            children: [
              Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.05,
                decoration: BoxDecoration(
                    color: MaterialStateColor.resolveWith((states) {
                      if (status == 1 || status == 4) {
                        return kPrimaryYellow;
                      }
                      if (status == 2 || status == 5) {
                        return kPrimaryBlue;
                      }
                      if (status == 6) {
                        return kPrimaryGreen;
                      }
                      if (status == 3 || status == 9) {
                        return kPrimaryRed;
                      }
                      return kPrimaryGrey;
                    }),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                child: Center(
                  child: Text(status_text, style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: deviceSize.width * 0.15,
                      child: Container(
                          height: deviceSize.width * 0.15,
                          width: deviceSize.width * 0.15,
                          decoration: const BoxDecoration(
                            color: kBackgroundBlue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(formatDatedd.format(DateTime.parse(start_date)),
                                  style: const TextStyle(color: kPrimaryWhite, fontWeight: FontWeight.bold)),
                              Text(
                                formatDateLLL.format(DateTime.parse(start_date)),
                                style: const TextStyle(color: kPrimaryWhite),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.03,
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Start Time",
                              style: TextStyle(color: kPrimaryPurple, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(start_time.substring(0, 8), style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("End Time", style: TextStyle(color: kPrimaryYellow, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(end_time.substring(0, 8), style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Duration", style: TextStyle(color: kPrimaryBlack, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(("${duration.toString()} Hours"), style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.05,
                decoration: const BoxDecoration(
                    color: kPrimaryWhite,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                child: Center(
                  child:
                      Text(requester_name, style: const TextStyle(color: kPrimaryBlack, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ));
  }
}
