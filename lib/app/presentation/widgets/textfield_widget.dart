import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  final String hintText;

  const WidgetTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(hintText: hintText),
      );
}
