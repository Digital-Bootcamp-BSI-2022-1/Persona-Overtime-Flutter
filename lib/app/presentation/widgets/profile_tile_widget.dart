import 'package:flutter/material.dart';
import 'package:persona_test/app/utils/constants.dart';

class WidgetProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const WidgetProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width * 0.8,
      height: deviceSize.height * 0.07,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: kPrimaryGrey))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kBackgroundBlue,
          ),
          SizedBox(
            width: deviceSize.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kPrimaryBlack),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kPrimaryGrey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
