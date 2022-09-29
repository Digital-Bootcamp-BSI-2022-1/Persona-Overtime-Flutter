import 'package:persona_test/app/presentation/pages/home/home_page.dart';
import 'package:persona_test/app/presentation/pages/main/main_controller.dart';
import 'package:persona_test/app/presentation/pages/login/login_page.dart';
import 'package:persona_test/app/presentation/pages/profile/profile_page.dart';
import 'package:persona_test/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class MainPage extends View {
  static const route = '/main';

  MainPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _MainViewState(MainController());
  }
}

class _MainViewState extends ViewState<MainPage, MainController> {
  _MainViewState(super.controller);

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const Center(child: CupertinoActivityIndicator()),
    const Center(child: CupertinoActivityIndicator()),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget get view {
    var deviceSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(color: kBackgroundWhite),
        // Container(color: kBackgroundBlue, height: deviceSize.height * 0.3),
        Scaffold(
          key: globalKey,
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kPrimaryWhite,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: 'Attendance'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: 'Timesheet'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: kBackgroundBlue,
            unselectedItemColor: kPrimaryGrey,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          ),
          body: _widgetOptions.elementAt(_selectedIndex)
        )
      ],
    );
  }
}
