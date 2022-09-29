import 'package:persona_test/app/presentation/pages/overtime/overtime_controller.dart';
import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/widgets/overtime_tile_widget.dart';
import 'package:persona_test/app/presentation/widgets/profile_tile_widget.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OvertimePage extends View {
  static const route = '/overtime';

  OvertimePage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _OvertimeViewState(OvertimeController());
  }
}

class _OvertimeViewState extends ViewState<OvertimePage, OvertimeController> {
  final OvertimeController controller;
  _OvertimeViewState(this.controller) : super(controller);

  @override
  Widget get view {
    var deviceSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(color: kPrimaryWhite),
        // Container(color: kBackgroundBlue, height: deviceSize.height * 0.3),
        Scaffold(
            key: globalKey,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Overtime"),
              backgroundColor: kPrimaryDarkBlue,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: deviceSize.width,
                    height: deviceSize.height * 0.075,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(width: 1, color: kBackgroundBlue)),
                    child: ControlledWidgetBuilder<OvertimeController>(
                      builder: (context, controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: deviceSize.width * 0.5 - 1,
                              height: deviceSize.height * 0.075,
                              child: TextButton(
                                  onPressed: () {
                                    controller.showSumbission();
                                  },
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      if (controller.selectedIndex == 0) {
                                        return kBackgroundBlue;
                                      }
                                      return kPrimaryWhite;
                                    }),
                                  ),
                                  child: Text(
                                    "My Submission",
                                    style: TextStyle(color:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      if (controller.selectedIndex == 0) {
                                        return kPrimaryWhite;
                                      }
                                      return kPrimaryGrey;
                                    })),
                                  )),
                            ),
                            SizedBox(
                              width: deviceSize.width * 0.5 - 1,
                              height: deviceSize.height * 0.075,
                              child: TextButton(
                                  onPressed: () {
                                    controller.showHistory();
                                  },
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      if (controller.selectedIndex == 1) {
                                        return kBackgroundBlue;
                                      }
                                      return kPrimaryWhite;
                                    }),
                                  ),
                                  child: Text(
                                    "History Overtime",
                                    style: TextStyle(color:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      if (controller.selectedIndex == 1) {
                                        return kPrimaryWhite;
                                      }
                                      return kPrimaryGrey;
                                    })),
                                  )),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.8,
                    child: ControlledWidgetBuilder<OvertimeController>(
                        builder: (context, controller) => controller.isLoading
                            ? const Center(child: CupertinoActivityIndicator())
                            : Column(
                                children: [
                                  if (controller.selectedIndex == 0)
                                    overtimeSumbissions(),
                                  if (controller.selectedIndex == 1)
                                    overtimeHistory(),
                                ],
                              )),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget overtimeSumbissions() {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: deviceSize.height * 0.73,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (controller.overtimeDataSubmission!.length == 0)
                    Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.3,
                        ),
                        Container(
                          height: deviceSize.height * 0.1,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/images/overtime_notfound.png'))),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.03,
                        ),
                        const Text(
                          "You haven't made any overtime request",
                          style: TextStyle(
                              color: kPrimaryGrey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  if (controller.overtimeDataSubmission!.length > 0)
                    Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.03,
                        ),
                        for (int i = 0;
                            i < controller.overtimeDataSubmission!.length;
                            i++)
                            if (controller.overtimeDataSubmission?[i]["status"] == 1 ||
                              controller.overtimeDataSubmission?[i]["status"] == 2 ||
                              controller.overtimeDataSubmission?[i]["status"] == 4 ||
                              controller.overtimeDataSubmission?[i]["status"] == 5)
                          Column(
                            children: [
                              WidgetOvertimeTileSubmission(
                                  start_date: controller.overtimeDataSubmission?[i]
                                      ["start_date"],
                                  start_time: controller.overtimeDataSubmission?[i]
                                      ["start_time"],
                                  end_time: controller.overtimeDataSubmission?[i]
                                      ["end_time"],
                                  status: controller.overtimeDataSubmission?[i]["status"],
                                  status_text: controller.overtimeDataSubmission?[i]
                                      ["status_text"],
                                  request_date: controller.overtimeDataSubmission?[i]
                                      ["request_date"]),
                              SizedBox(
                                height: deviceSize.height * 0.02,
                              ),
                            ],
                          ),
                        SizedBox(
                          height: deviceSize.height * 0.03,
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: deviceSize.height * 0.065,
          width: deviceSize.width * 0.9,
          child: TextButton(
            onPressed: () {
              controller.navigateToOvertimeRequest();
            },
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: kPrimaryBlue),
            child: const Text(
              "CREATE OVERTIME REQUEST",
              style: TextStyle(color: kPrimaryWhite),
            ),
          ),
        )
      ],
    );
  }

  Widget overtimeHistory() {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: deviceSize.height * 0.8,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (controller.overtimeDataHistory!.length == 0)
                    Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.3,
                        ),
                        Container(
                          height: deviceSize.height * 0.1,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/images/overtime_notfound.png'))),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.03,
                        ),
                        const Text(
                          "There are no overtime history",
                          style: TextStyle(
                              color: kPrimaryGrey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  if (controller.overtimeDataHistory!.length > 0)
                    Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.03,
                        ),
                        for (int i = 0;
                            i < controller.overtimeDataHistory!.length;
                            i++)
                          if (controller.overtimeDataHistory?[i]["status"] == 6 ||
                              controller.overtimeDataHistory?[i]["status"] == 3 ||
                              controller.overtimeDataHistory?[i]["status"] == 9)
                            Column(
                              children: [
                                WidgetOvertimeTileHistory(
                                  start_date: controller.overtimeDataHistory?[i]
                                      ["start_date"],
                                  start_time: controller.overtimeDataHistory?[i]
                                      ["start_time"],
                                  end_time: controller.overtimeDataHistory?[i]
                                      ["end_time"],
                                  duration: controller.overtimeDataHistory?[i]
                                      ["duration"],
                                  status: controller.overtimeDataHistory?[i]["status"],
                                  status_text: controller.overtimeDataHistory?[i]
                                      ["status_text"],
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.02,
                                ),
                              ],
                            ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
