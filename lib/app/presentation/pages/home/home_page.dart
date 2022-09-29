import 'package:persona_test/app/presentation/pages/home/home_controller.dart';
import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  static const route = '/home';

  HomePage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController());
  }
}

class _HomeViewState extends ViewState<HomePage, HomeController> {
  // _HomeViewState(super.controller);

  final HomeController controller;
  _HomeViewState(this.controller) : super(controller);

  @override
  Widget get view {
    var deviceSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(color: kBackgroundWhite),
        Container(color: kBackgroundBlue, height: deviceSize.height * 0.3),
        Scaffold(
            key: globalKey,
            backgroundColor: Colors.transparent,
            body: ControlledWidgetBuilder<HomeController>(
              builder: (context, controller) => controller.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: deviceSize.height * 0.07),
                            SizedBox(
                              width: deviceSize.width * 0.9,
                              child: RichText(
                                text: TextSpan(
                                  text: "Good Afternoon, ",
                                  style: const TextStyle(
                                      color: kPrimaryWhite,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: controller.userData ?? "",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: deviceSize.height * 0.01),
                            Material(
                              elevation: 1,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Container(
                                width: deviceSize.width * 0.9,
                                height: deviceSize.height * 0.4,
                                decoration: const BoxDecoration(
                                    color: kPrimaryWhite,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StreamBuilder(
                                        stream: Stream.periodic(
                                            const Duration(milliseconds: 300)),
                                        builder: (context, snapshot) {
                                          return Text(
                                            formatTime.format(DateTime.now()),
                                            style: const TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }),
                                    SizedBox(height: deviceSize.height * 0.02),
                                    Text(
                                      formatDate.format(DateTime.now()),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryGrey),
                                    ),
                                    SizedBox(height: deviceSize.height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: kPrimaryBlue,
                                        ),
                                        SizedBox(
                                            width: deviceSize.width * 0.02),
                                        const Text(
                                          "Location",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: deviceSize.height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: deviceSize.width * 0.35,
                                          height: deviceSize.height * 0.15,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Clock In",
                                                style: TextStyle(
                                                    color: kPrimaryPurple,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Text(
                                                "--:--:--",
                                                style: TextStyle(
                                                    color: kPrimaryBlack,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                  height:
                                                      deviceSize.height * 0.01),
                                              const Text(
                                                "-",
                                                style: TextStyle(
                                                    color: kPrimaryGrey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: deviceSize.height * 0.1,
                                          color: kPrimaryBlack,
                                        ),
                                        Container(
                                          width: deviceSize.width * 0.35,
                                          height: deviceSize.height * 0.15,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Clock Out",
                                                style: TextStyle(
                                                    color: kPrimaryYellow,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Text(
                                                "--:--:--",
                                                style: TextStyle(
                                                    color: kPrimaryBlack,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                  height:
                                                      deviceSize.height * 0.01),
                                              const Text(
                                                "-",
                                                style: TextStyle(
                                                    color: kPrimaryGrey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: deviceSize.width * 0.75,
                                      height: deviceSize.height * 0.06,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            backgroundColor: kPrimaryBlue),
                                        child: const Text(
                                          "CLOCK IN",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryWhite),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: deviceSize.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  elevation: 1,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Container(
                                    width: deviceSize.width * 0.425,
                                    height: deviceSize.height * 0.13,
                                    decoration: const BoxDecoration(
                                        color: kPrimaryWhite,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: deviceSize.height * 0.07,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/home_leave.png'))),
                                        ),
                                        const Text(
                                          "Leave",
                                          style: TextStyle(
                                              color: kPrimaryBlack,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: deviceSize.width * 0.05),
                                Material(
                                  elevation: 1,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Container(
                                    width: deviceSize.width * 0.425,
                                    height: deviceSize.height * 0.13,
                                    decoration: const BoxDecoration(
                                        color: kPrimaryWhite,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: deviceSize.height * 0.07,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/home_payroll.png'))),
                                        ),
                                        const Text(
                                          "Payroll",
                                          style: TextStyle(
                                              color: kPrimaryBlack,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: deviceSize.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  elevation: 1,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Container(
                                    width: deviceSize.width * 0.425,
                                    height: deviceSize.height * 0.13,
                                    decoration: const BoxDecoration(
                                        color: kPrimaryWhite,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: deviceSize.height * 0.07,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/home_hospital.png'))),
                                        ),
                                        const Text(
                                          "Hospital",
                                          style: TextStyle(
                                              color: kPrimaryBlack,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: deviceSize.width * 0.05),
                                Material(
                                  elevation: 1,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Container(
                                    width: deviceSize.width * 0.425,
                                    height: deviceSize.height * 0.13,
                                    decoration: const BoxDecoration(
                                        color: kPrimaryWhite,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: deviceSize.height * 0.07,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/home_assessment.png'))),
                                        ),
                                        const Text(
                                          "Assessment",
                                          style: TextStyle(
                                              color: kPrimaryBlack,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: deviceSize.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.navigateToOvertime();
                                  },
                                  child: Material(
                                    elevation: 1,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    child: Container(
                                      width: deviceSize.width * 0.425,
                                      height: deviceSize.height * 0.13,
                                      decoration: const BoxDecoration(
                                          color: kPrimaryWhite,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: deviceSize.height * 0.07,
                                            child: const Icon(
                                              Icons.more_time_outlined,
                                              color: kPrimaryBlueGreen,
                                              size: 40,
                                            ),
                                          ),
                                          const Text(
                                            "Overtime",
                                            style: TextStyle(
                                                color: kPrimaryBlack,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: deviceSize.height * 0.05),
                          ],
                        ),
                      ),
                    ),
            ))
      ],
    );
  }
}
