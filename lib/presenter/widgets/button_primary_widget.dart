import 'package:flutter/material.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  final String text;
  final double height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final VoidCallback? onPressed;

  const ButtonPrimaryWidget({
    super.key,
    required this.text,
    this.height = 42,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade300, Colors.blue],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onPressed,
          child: Container(
            width: width ?? double.infinity,
            height: height,
            padding: padding,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
