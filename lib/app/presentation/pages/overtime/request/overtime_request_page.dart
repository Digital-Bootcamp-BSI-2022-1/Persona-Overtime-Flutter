import 'package:persona_test/app/presentation/pages/overtime/request/overtime_request_controller.dart';
import 'package:persona_test/app/presentation/widgets/popup_dialog_widget.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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

class _OvertimeRequestViewState extends ViewState<OvertimeRequestPage, OvertimeRequestController> {
  final OvertimeRequestController controller;
  _OvertimeRequestViewState(this.controller) : super(controller);

  @override
  Widget get view {
    var deviceSize = MediaQuery.of(context).size;
    return ControlledWidgetBuilder<OvertimeRequestController>(builder: (context, controller) {
      return Stack(
        children: [
          Container(color: kPrimaryWhite),
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
                                SizedBox(height: deviceSize.height * 0.03),
                                SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: RichText(
                                    text: const TextSpan(
                                      text: "Start Date",
                                      style: TextStyle(color: kPrimaryBlack),
                                      children: <TextSpan>[TextSpan(text: "*", style: TextStyle(color: kPrimaryRed))],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.selectStartDate(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeRequestController>(
                                          builder: (context, controller) {
                                        return Row(
                                          children: [
                                            SizedBox(
                                                width: deviceSize.width * 0.1, child: const Icon(Icons.calendar_today)),
                                            controller.dateStartCon.text.isNotEmpty
                                                ? SizedBox(
                                                    width: deviceSize.width * 0.75,
                                                    child: Text(
                                                      controller.dateStartCon.text,
                                                      style: const TextStyle(fontSize: 16, color: kPrimaryBlack),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width: deviceSize.width * 0.7,
                                                    child: const Text(
                                                      "Select Date",
                                                      style: TextStyle(fontSize: 16),
                                                    ))
                                          ],
                                        );
                                      })),
                                ),
                                SizedBox(height: deviceSize.height * 0.02),
                                SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: RichText(
                                    text: const TextSpan(
                                      text: "End Date",
                                      style: TextStyle(color: kPrimaryBlack),
                                      children: <TextSpan>[TextSpan(text: "*", style: TextStyle(color: kPrimaryRed))],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.selectEndDate(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeRequestController>(
                                          builder: (context, controller) {
                                        return Row(
                                          children: [
                                            SizedBox(
                                                width: deviceSize.width * 0.1, child: const Icon(Icons.calendar_today)),
                                            controller.dateEndCon.text.isNotEmpty
                                                ? SizedBox(
                                                    width: deviceSize.width * 0.75,
                                                    child: Text(
                                                      controller.dateEndCon.text,
                                                      style: const TextStyle(fontSize: 16, color: kPrimaryBlack),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width: deviceSize.width * 0.7,
                                                    child: const Text(
                                                      "Select Date",
                                                      style: TextStyle(fontSize: 16),
                                                    ))
                                          ],
                                        );
                                      })),
                                ),
                                SizedBox(height: deviceSize.height * 0.02),
                                SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: RichText(
                                    text: const TextSpan(
                                      text: "Start Time (Plan)",
                                      style: TextStyle(color: kPrimaryBlack),
                                      children: <TextSpan>[TextSpan(text: "*", style: TextStyle(color: kPrimaryRed))],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.selectStartTime(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeRequestController>(
                                          builder: (context, controller) {
                                        return Row(
                                          children: [
                                            SizedBox(
                                                width: deviceSize.width * 0.1, child: const Icon(Icons.access_time)),
                                            controller.timeStartCon.text.isNotEmpty
                                                ? SizedBox(
                                                    width: deviceSize.width * 0.75,
                                                    child: Text(
                                                      controller.timeStartCon.text,
                                                      style: const TextStyle(fontSize: 16, color: kPrimaryBlack),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width: deviceSize.width * 0.7,
                                                    child: const Text(
                                                      "Select Time",
                                                      style: TextStyle(fontSize: 16),
                                                    ))
                                          ],
                                        );
                                      })),
                                ),
                                SizedBox(height: deviceSize.height * 0.02),
                                SizedBox(
                                  width: deviceSize.width * 0.9,
                                  child: RichText(
                                    text: const TextSpan(
                                      text: "End Time (Plan)",
                                      style: TextStyle(color: kPrimaryBlack),
                                      children: <TextSpan>[TextSpan(text: "*", style: TextStyle(color: kPrimaryRed))],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.selectEndTime(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeRequestController>(
                                          builder: (context, controller) {
                                        return Row(
                                          children: [
                                            SizedBox(
                                                width: deviceSize.width * 0.1, child: const Icon(Icons.access_time)),
                                            controller.timeEndCon.text.isNotEmpty
                                                ? SizedBox(
                                                    width: deviceSize.width * 0.75,
                                                    child: Text(
                                                      controller.timeEndCon.text,
                                                      style: const TextStyle(fontSize: 16, color: kPrimaryBlack),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width: deviceSize.width * 0.7,
                                                    child: const Text(
                                                      "Select Time",
                                                      style: TextStyle(fontSize: 16),
                                                    ))
                                          ],
                                        );
                                      })),
                                ),
                                SizedBox(height: deviceSize.height * 0.02),
                                ControlledWidgetBuilder<OvertimeRequestController>(builder: (context, controller) {
                                  if (controller.attachment == null) {
                                    return SizedBox(
                                        width: deviceSize.width * 0.9,
                                        height: deviceSize.height * 0.07,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            controller.pickFromGallery();
                                          },
                                          child: const Text("Upload Attachment", style: TextStyle(color: kPrimaryBlue)),
                                        ));
                                  }
                                  if (controller.attachment != null) {
                                    return SizedBox(
                                      height: deviceSize.width * 0.5,
                                      width: deviceSize.width * 0.5,
                                      child: Stack(
                                        children: [
                                          SizedBox(child: Image.file(controller.attachment!)),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: kPrimaryWhite, borderRadius: BorderRadius.circular(25)),
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.clearAttachment();
                                                    },
                                                    icon: const Icon(Icons.close))),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                }),
                                SizedBox(height: deviceSize.height * 0.02),
                                SizedBox(
                                    width: deviceSize.width * 0.9,
                                    child: const Text(
                                      "Remarks",
                                      textAlign: TextAlign.start,
                                    )),
                                SizedBox(
                                  width: deviceSize.width * 0.85,
                                  child: TextField(
                                    maxLines: 2,
                                    controller: controller.remarksCon,
                                  ),
                                ),
                                SizedBox(height: deviceSize.height * 0.05),
                                SizedBox(
                                    width: deviceSize.width * 0.9,
                                    child: Text(
                                      "Requested Date : ${formatDateOvertimeReq.format(DateTime.now())}",
                                      textAlign: TextAlign.end,
                                    )),
                                SizedBox(height: deviceSize.height * 0.03),
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
                        onPressed: () async {
                          if (controller.dateStartCon.text.isNotEmpty &&
                              controller.dateEndCon.text.isNotEmpty &&
                              controller.timeStartCon.text.isNotEmpty &&
                              controller.timeEndCon.text.isNotEmpty) {
                            controller.postOvertimeRequest(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => const WidgetPopupDialog(
                                title: "Request Error",
                                message: "Data Submitted Incomplete",
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
              )),
          if (controller.isLoading)
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              decoration: const BoxDecoration(color: kBlurGrey),
              child: const CupertinoActivityIndicator(),
            )
        ],
      );
    });
  }
}
