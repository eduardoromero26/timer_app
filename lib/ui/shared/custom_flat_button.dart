import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Color colorText;
  final Function onPressed;
  final Color backgroundColor;

  const CustomFlatButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.colorText = Colors.white,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: colorText, backgroundColor: backgroundColor),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
