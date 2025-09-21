import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final Icon? icon;
  final Icon? iconPassword;
  final bool obscureText;
  final bool showError;

  const TextFieldCustomWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = 'Email',
    required this.icon,
    required this.iconPassword,
    this.obscureText = false,
    this.showError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 42,
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 14),
              hintText: hintText,
              filled: true,
              fillColor: Colors.blue.shade50,
              prefixIcon: icon,
              suffixIcon: iconPassword,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (showError && controller.text.isEmpty)
          const Text(
            'This form is required',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
