import 'package:flutter/material.dart';
import 'package:persona_test/app/utils/constants.dart';

class WidgetOvertimeTileHistory extends StatelessWidget {
  final String start_date;
  final String start_time;
  final String end_time;
  final int duration;
  final int status;
  final String status_text;

  const WidgetOvertimeTileHistory({
    super.key,
    required this.start_date,
    required this.start_time,
    required this.end_time,
    required this.duration,
    required this.status,
    required this.status_text,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
            elevation: MaterialStateProperty.all(1),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
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
                      if (status == 1) {
                        return kPrimaryYellow;
                      }
                      if (status == 2 || status == 4 || status == 5) {
                        return kPrimaryBlue;
                      }
                      if (status == 6) {
                        return Colors.green;
                      }
                      if (status == 3 || status == 9) {
                        return kPrimaryRed;
                      }
                      return kPrimaryGrey;
                    }),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Center(
                  child: Text(status_text,
                      style: const TextStyle(
                          color: kPrimaryWhite, fontWeight: FontWeight.bold)),
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
                              Text(DateTime.parse(start_date).day.toString(),
                                  style: const TextStyle(
                                      color: kPrimaryWhite,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                formatDay
                                    .format(DateTime.parse(start_date))
                                    .substring(0, 3),
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
                              style: TextStyle(
                                  color: kPrimaryPurple,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(start_time.substring(0, 8),
                              style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("End Time",
                              style: TextStyle(
                                  color: kPrimaryYellow,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(end_time.substring(0, 8),
                              style: const TextStyle(color: kPrimaryBlack))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Duration",
                              style: TextStyle(
                                  color: kPrimaryBlack, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(("${duration.toString()} Hours"),
                              style: const TextStyle(color: kPrimaryBlack))
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

  const WidgetOvertimeTileSubmission({
    super.key,
    required this.start_date,
    required this.start_time,
    required this.end_time,
    required this.status,
    required this.status_text,
    required this.request_date,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
            foregroundColor: MaterialStateProperty.all(kPrimaryBlack),
            elevation: MaterialStateProperty.all(1),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
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
                      if (status == 1) {
                        return kPrimaryYellow;
                      }
                      if (status == 2 || status == 4 || status == 5) {
                        return kPrimaryBlue;
                      }
                      if (status == 6) {
                        return Colors.green;
                      }
                      if (status == 3 || status == 9) {
                        return kPrimaryRed;
                      }
                      return kPrimaryGrey;
                    }),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Center(
                  child: Text(status_text,
                      style: const TextStyle(
                          color: kPrimaryWhite, fontWeight: FontWeight.bold)),
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
                              Text(DateTime.parse(start_date).day.toString(),
                                  style: const TextStyle(
                                      color: kPrimaryWhite,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                formatDay
                                    .format(DateTime.parse(start_date))
                                    .substring(0, 3),
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
