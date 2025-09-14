import 'package:flutter/material.dart';

class ButtonRedWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? width;
  final double height;
  final VoidCallback? onPressed;

  const ButtonRedWidget({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.width,
    this.height = 42,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.red.shade300, width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.red.shade300,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
