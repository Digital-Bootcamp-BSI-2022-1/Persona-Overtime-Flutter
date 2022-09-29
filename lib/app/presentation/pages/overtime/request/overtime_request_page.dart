import 'package:persona_test/app/presentation/pages/overtime/request/overtime_request_controller.dart';
import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/widgets/profile_tile_widget.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OvertimeRequestPage extends View {
  static const route = '/overtime/request';

  OvertimeRequestPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _OvertimeRequestViewState(OvertimeRequestController());
  }
}

class _OvertimeRequestViewState
    extends ViewState<OvertimeRequestPage, OvertimeRequestController> {
  final OvertimeRequestController controller;
  _OvertimeRequestViewState(this.controller) : super(controller);

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget get view {
    var deviceSize = MediaQuery.of(context).size;

    final TextEditingController dateStartCon = TextEditingController();
    final TextEditingController dateEndCon = TextEditingController();
    final TextEditingController timeStartCon = TextEditingController();
    final TextEditingController timeEndCon = TextEditingController();
    final TextEditingController remarksCon = TextEditingController();
    String dateStartText = "select date";

    String durationOT = "0";
    DateTime rangeStartDateOT = DateTime.now().add(const Duration(days: 7));
    DateTime? pickedStartDateOT;

    return Stack(
      children: [
        Container(color: kPrimaryWhite),
        // Container(color: kBackgroundBlue, height: deviceSize.height * 0.3),
        Scaffold(
            key: globalKey,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Create Overtime Request"),
              backgroundColor: kPrimaryDarkBlue,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.8,
                    child: SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: deviceSize.height * 0.05),
                              SizedBox(
                                width: deviceSize.width * 0.9,
                                child: RichText(
                                  text: const TextSpan(
                                    text: "Start Date",
                                    style: TextStyle(color: kPrimaryBlack),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(color: kPrimaryRed))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: ControlledWidgetBuilder<
                                          OvertimeRequestController>(
                                      builder: (context, controller) {
                                    return TextField(
                                      controller: controller.dateStartCon,
                                      onTap: () {
                                        controller.selectStartDate(context);
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Select Date",
                                          prefixIcon:
                                              Icon(Icons.calendar_today)),
                                    );
                                  })),
                              SizedBox(height: deviceSize.height * 0.02),
                              SizedBox(
                                width: deviceSize.width * 0.9,
                                child: RichText(
                                  text: const TextSpan(
                                    text: "End Date",
                                    style: TextStyle(color: kPrimaryBlack),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(color: kPrimaryRed))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: ControlledWidgetBuilder<
                                          OvertimeRequestController>(
                                      builder: (context, controller) {
                                    return TextField(
                                      controller: controller.dateEndCon,
                                      onTap: () {
                                        controller.selectEndDate(context);
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Select Date",
                                          prefixIcon:
                                              Icon(Icons.calendar_today)),
                                    );
                                  })),
                              SizedBox(height: deviceSize.height * 0.02),
                              SizedBox(
                                width: deviceSize.width * 0.9,
                                child: RichText(
                                  text: const TextSpan(
                                    text: "Start Time (Plan)",
                                    style: TextStyle(color: kPrimaryBlack),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(color: kPrimaryRed))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: deviceSize.width * 0.9,
                                child: TextField(
                                  controller: controller.timeStartCon,
                                  onTap: () {
                                    controller.selectStartTime(context);
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Select Time",
                                      prefixIcon: Icon(Icons.access_time)),
                                ),
                              ),
                              SizedBox(height: deviceSize.height * 0.02),
                              SizedBox(
                                width: deviceSize.width * 0.9,
                                child: RichText(
                                  text: const TextSpan(
                                    text: "End Time (Plan)",
                                    style: TextStyle(color: kPrimaryBlack),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(color: kPrimaryRed))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: deviceSize.width * 0.9,
                                child: TextField(
                                  controller: controller.timeEndCon,
                                  onTap: () {
                                    controller.selectEndTime(context);
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Select Time",
                                      prefixIcon: Icon(Icons.access_time)),
                                ),
                              ),
                              SizedBox(height: deviceSize.height * 0.02),
                              SizedBox(
                                  width: deviceSize.width * 0.9,
                                  height: deviceSize.height * 0.07,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: const Text("Upload Attachment", style: TextStyle(color: kPrimaryBlue)),
                                  )),
                              SizedBox(height: deviceSize.height * 0.02),
                              SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: const Text(
                                    "Remarks",
                                    textAlign: TextAlign.start,
                                  )),
                              SizedBox(
                                width: deviceSize.width * 0.9,
                                child: TextField(
                                  maxLines: 2,
                                  controller: controller.remarksCon,
                                ),
                              ),
                              SizedBox(height: deviceSize.height * 0.05),
                              SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: Text(
                                    "Requested Date : ${formatDateOvertimeReq
                                            .format(DateTime.now())}",
                                    textAlign: TextAlign.end,
                                  )),
                              SizedBox(height: deviceSize.height * 0.05),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.01),
                  SizedBox(
                    height: deviceSize.height * 0.065,
                    width: deviceSize.width * 0.9,
                    child: TextButton(
                      onPressed: () {
                        if (controller.dateStartCon.text.isNotEmpty && controller.dateEndCon.text.isNotEmpty && controller.timeStartCon.text.isNotEmpty && controller.timeEndCon.text.isNotEmpty) {
                          Navigator.pop(context);
                        } else {
                          showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        buildPopupDialog(context),
                                  );
                        }
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: kPrimaryBlue),
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(color: kPrimaryWhite),
                      ),
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.01),
                ],
              ),
            ))
      ],
    );
  }

  Widget buildPopupDialog(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      title: Container(
        height: 50,
        width: 300,
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          // color: Color(0xFF242424)
        ),
        child: Stack(
          children: const [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Request Failed',
                style: TextStyle(
                    color: kPrimaryGrey,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: IconButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       icon: const Icon(
            //         Icons.clear,
            //         color: Color(0xFFFFFFFF),
            //       )),
            // ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text(
            "The date or time submitted is incorrect.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14, color: kPrimaryGrey),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 20.0),
      actions: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            side: const BorderSide(width: 0.0, color: kPrimaryWhite),
            elevation: 0,
            // primary: const Color(0xFFCA000E),
            // backgroundColor: const Color(0xFFCA000E),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(
                color: kBackgroundBlue,
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),
        ),
      ],
      // actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    );
  }
}
