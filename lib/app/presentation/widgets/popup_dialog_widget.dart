import 'package:flutter/material.dart';
import 'package:persona_test/app/utils/constants.dart';

class WidgetPopupDialog extends StatelessWidget {
  final String title;
  final String message;

  const WidgetPopupDialog({
    super.key,
    this.title = "",
    this.message = "",
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      title: Container(
        height: deviceSize.height * 0.1,
        width: deviceSize.width * 0.7,
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        decoration: const BoxDecoration(
          color: kPrimaryWhite,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(color: kPrimaryGrey, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: deviceSize.height * 0.1,
            width: deviceSize.width * 0.6,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                message,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 14, color: kPrimaryGrey),
              ),
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            elevation: 0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(color: kBackgroundBlue, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    );
  }
}
