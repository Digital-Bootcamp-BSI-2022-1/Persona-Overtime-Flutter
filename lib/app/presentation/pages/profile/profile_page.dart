import 'package:persona_test/app/presentation/pages/profile/profile_controller.dart';
import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/widgets/profile_tile_widget.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfilePage extends View {
  static const route = '/profile';

  ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _ProfileViewState(ProfileController());
  }
}

class _ProfileViewState extends ViewState<ProfilePage, ProfileController> {
  // _ProfileViewState(super.controller);

  final ProfileController controller;
  _ProfileViewState(this.controller) : super(controller);

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
            body: ControlledWidgetBuilder<ProfileController>(
              builder: (context, controller) => controller.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: deviceSize.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: deviceSize.width * 0.3),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                      text: "My Profile",
                                      style: TextStyle(
                                          color: kPrimaryWhite,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal)),
                                ),
                                SizedBox(width: deviceSize.width * 0.2),
                                ControlledWidgetBuilder<ProfileController>(
                                  builder: (context, controller) {
                                    return SizedBox(
                                      width: deviceSize.width * 0.1,
                                      child: PopupMenuButton(
                                        icon: const Icon(Icons.settings,
                                            color: kPrimaryWhite),
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem(
                                              child: const Text(
                                                "Logout",
                                                style: TextStyle(
                                                    color: kPrimaryRed),
                                              ),
                                              onTap: () async {
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                prefs.clear();
                                                controller.navigateToLogin();
                                              },
                                            )
                                          ];
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
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
                                    SizedBox(height: deviceSize.height * 0.15),
                                    Text(controller.profileData['name'] ?? "",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: deviceSize.height * 0.03),
                                    Text(controller.profileData['nik'] ?? "",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(controller.profileData['role'] ?? "",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: deviceSize.height * 0.01),
                            WidgetProfileTile(
                                title: "Grade",
                                subtitle: controller.profileData['grade'] ?? "",
                                icon: Icons.star),
                            WidgetProfileTile(
                                title: "Employment Status",
                                subtitle: controller
                                        .profileData['employment_status'] ??
                                    "",
                                icon: Icons.people),
                            WidgetProfileTile(
                                title: "Mobile Phone",
                                subtitle: controller.profileData['phone'] ?? "",
                                icon: Icons.phone_android),
                            WidgetProfileTile(
                                title: "Email",
                                subtitle: controller.profileData['email'] ?? "",
                                icon: Icons.alternate_email),
                            WidgetProfileTile(
                                title: "No KTP",
                                subtitle: controller.profileData['ktp'] ?? "",
                                icon: Icons.contact_phone),
                            WidgetProfileTile(
                                title: "NPWP",
                                subtitle: controller.profileData['npwp'] ?? "",
                                icon: Icons.credit_card),
                            WidgetProfileTile(
                                title: "Join Date",
                                subtitle:
                                    controller.profileData['join_date'] ?? "",
                                icon: Icons.calendar_month),
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
