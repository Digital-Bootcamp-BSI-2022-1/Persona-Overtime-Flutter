import 'package:persona_test/app/presentation/pages/overtime/detail/overtime_detail_controller.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OvertimeDetailPage extends View {
  static const route = '/overtime/detail';

  final int idOT;

  OvertimeDetailPage(this.idOT, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _OvertimeDetailViewState(OvertimeDetailController());
  }
}

class _OvertimeDetailViewState extends ViewState<OvertimeDetailPage, OvertimeDetailController> {
  final OvertimeDetailController controller;
  _OvertimeDetailViewState(this.controller) : super(controller);

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget get view {
    var deviceSize = MediaQuery.of(context).size;

    return ControlledWidgetBuilder<OvertimeDetailController>(builder: (context, controller) {
      return Stack(
        children: [
          Container(color: kPrimaryWhite),
          Scaffold(
              key: globalKey,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text("Overtime Request Detail"),
                backgroundColor: kPrimaryDarkBlue,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: controller.isCompleted == "0" ? deviceSize.height * 0.8 : deviceSize.height * 0.9,
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
                                      text: "Requester",
                                      style: TextStyle(color: kPrimaryBlack),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeDetailController>(
                                          builder: (context, controller) {
                                        return Row(
                                          children: [
                                            SizedBox(
                                                width: deviceSize.width * 0.1, child: const Icon(Icons.calendar_today)),
                                            controller.requester.isNotEmpty
                                                ? SizedBox(
                                                    width: deviceSize.width * 0.75,
                                                    child: Text(
                                                      controller.requester,
                                                      style: const TextStyle(fontSize: 16, color: kPrimaryBlack),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width: deviceSize.width * 0.7,
                                                    child: const Text(
                                                      "Requester Name",
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
                                      text: "Start Date",
                                      style: TextStyle(color: kPrimaryBlack),
                                      children: <TextSpan>[TextSpan(text: "*", style: TextStyle(color: kPrimaryRed))],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: (controller.status == "2" || controller.status == "5")
                                      ? () {
                                          controller.selectStartDate(context);
                                        }
                                      : null,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeDetailController>(
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
                                  onPressed: (controller.status == "2" || controller.status == "5")
                                      ? () {
                                          controller.selectEndDate(context);
                                        }
                                      : null,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeDetailController>(
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
                                if (controller.status != "2" &&
                                    controller.status != "4" &&
                                    controller.status != "5" &&
                                    controller.status != "6")
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
                                if (controller.status == "2" ||
                                    controller.status == "4" ||
                                    controller.status == "5" ||
                                    controller.status == "6")
                                  SizedBox(
                                    width: deviceSize.width * 0.9,
                                    child: RichText(
                                      text: const TextSpan(
                                        text: "Start Time (Actual)",
                                        style: TextStyle(color: kPrimaryBlack),
                                        children: <TextSpan>[TextSpan(text: "*", style: TextStyle(color: kPrimaryRed))],
                                      ),
                                    ),
                                  ),
                                TextButton(
                                  onPressed: (controller.status == "2" || controller.status == "5")
                                      ? () {
                                          controller.selectStartTime(context);
                                        }
                                      : null,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeDetailController>(
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
                                if (controller.status != "2" &&
                                    controller.status != "4" &&
                                    controller.status != "5" &&
                                    controller.status != "6")
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
                                if (controller.status == "2" ||
                                    controller.status == "4" ||
                                    controller.status == "5" ||
                                    controller.status == "6")
                                  SizedBox(
                                    width: deviceSize.width * 0.9,
                                    child: RichText(
                                      text: const TextSpan(
                                        text: "End Time (Actual)",
                                        style: TextStyle(color: kPrimaryBlack),
                                        children: <TextSpan>[TextSpan(text: "*", style: TextStyle(color: kPrimaryRed))],
                                      ),
                                    ),
                                  ),
                                TextButton(
                                  onPressed: (controller.status == "2" || controller.status == "5")
                                      ? () {
                                          controller.selectEndTime(context);
                                        }
                                      : null,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                    foregroundColor: MaterialStateProperty.all(kPrimaryGrey),
                                  ),
                                  child: Container(
                                      width: deviceSize.width * 0.85,
                                      height: deviceSize.height * 0.05,
                                      decoration:
                                          const BoxDecoration(border: Border(bottom: BorderSide(color: kPrimaryGrey))),
                                      child: ControlledWidgetBuilder<OvertimeDetailController>(
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
                                ControlledWidgetBuilder<OvertimeDetailController>(builder: (context, controller) {
                                  if (controller.attachmentURL == null) {
                                    if (controller.attachment == null) {
                                      if (controller.status == "2") {
                                        return SizedBox(
                                            width: deviceSize.width * 0.9,
                                            height: deviceSize.height * 0.07,
                                            child: OutlinedButton(
                                              onPressed: () {
                                                controller.pickFromGallery();
                                              },
                                              child: const Text("Upload Attachment",
                                                  style: TextStyle(color: kPrimaryBlue)),
                                            ));
                                      }
                                      return const SizedBox();
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
                                  }
                                  if (controller.attachmentURL != null) {
                                    if (controller.attachmentURL!.endsWith("pdf")) {
                                      return SizedBox(
                                        height: deviceSize.width * 0.2,
                                        width: deviceSize.width * 0.8,
                                        child: TextButton(
                                          onPressed: () {
                                            controller.viewPDFfromURL(
                                                context, 'http://africau.edu/images/default/sample.pdf');
                                          },
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(kPrimaryWhite),
                                              elevation: MaterialStateProperty.all(1)),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: deviceSize.width * 0.1,
                                                  child: const Icon(Icons.picture_as_pdf)),
                                              SizedBox(
                                                width: deviceSize.width * 0.6,
                                                height: deviceSize.width * 0.2,
                                                child: Center(
                                                  child: Text(
                                                    controller.attachmentURL.toString().replaceAll(
                                                        "http://res.cloudinary.com/personacloud/image/upload/", ""),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        height: deviceSize.width * 0.5,
                                        width: deviceSize.width * 0.5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(image: NetworkImage(controller.attachmentURL!))),
                                      );
                                    }
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
                                  width: deviceSize.width * 0.9,
                                  child: TextField(
                                    enabled: (controller.status == "2" || controller.status == "5") ? true : false,
                                    maxLines: 2,
                                    controller: controller.remarksCon,
                                  ),
                                ),
                                SizedBox(height: deviceSize.height * 0.05),
                                SizedBox(
                                    height: deviceSize.height * 0.03,
                                    width: deviceSize.width * 0.9,
                                    child: Text(
                                      "Duration : ${controller.duration} Hours",
                                      textAlign: TextAlign.end,
                                    )),
                                SizedBox(
                                    height: deviceSize.height * 0.03,
                                    width: deviceSize.width * 0.9,
                                    child: Text(
                                      "Requested Date : ${controller.dateRequested}",
                                      textAlign: TextAlign.end,
                                    )),
                                if (controller.status == "2" ||
                                    controller.status == "4" ||
                                    controller.status == "5" ||
                                    controller.status == "6")
                                  SizedBox(
                                      width: deviceSize.width * 0.9,
                                      height: deviceSize.height * 0.03,
                                      child: Text(
                                        "Approved Date : ${controller.dateApproved}",
                                        textAlign: TextAlign.end,
                                      )),
                                if (controller.isCompleted == "1")
                                  SizedBox(
                                      width: deviceSize.width * 0.9,
                                      height: deviceSize.height * 0.03,
                                      child: Text(
                                        "Completed Date : ${controller.dateCompleted}",
                                        textAlign: TextAlign.end,
                                      )),
                                SizedBox(height: deviceSize.height * 0.02),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceSize.height * 0.01),
                    if (controller.isCompleted == "0" && (controller.status == "2" || controller.status == "5"))
                      SizedBox(
                        height: deviceSize.height * 0.065,
                        width: deviceSize.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: deviceSize.height * 0.065,
                              width: deviceSize.width * 0.4,
                              child: TextButton(
                                onPressed: () {
                                  controller.postOvertimeUpdate(context, 4);
                                },
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    backgroundColor: kPrimaryBlue),
                                child: const Text(
                                  "SUBMIT SETTLEMENT",
                                  style: TextStyle(color: kPrimaryWhite),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceSize.height * 0.065,
                              width: deviceSize.width * 0.4,
                              child: TextButton(
                                onPressed: () {
                                  controller.postOvertimeUpdate(context, 9);
                                },
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    backgroundColor: kPrimaryRed),
                                child: const Text(
                                  "CANCEL",
                                  style: TextStyle(color: kPrimaryWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (controller.isCompleted == "0" && (controller.status == "1" || controller.status == "4"))
                      SizedBox(
                        height: deviceSize.height * 0.065,
                        width: deviceSize.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: deviceSize.height * 0.065,
                              width: deviceSize.width * 0.4,
                              child: TextButton(
                                onPressed: () {
                                  controller.postOvertimeUpdate(context, 9);
                                },
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    backgroundColor: kPrimaryRed),
                                child: const Text(
                                  "CANCEL",
                                  style: TextStyle(color: kPrimaryWhite),
                                ),
                              ),
                            ),
                          ],
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
