import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;

  CustomElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
