import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final String hintText;

  const SearchTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.hintText = 'Search Asset',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14),
          hintText: hintText,
          filled: true,
          fillColor: Colors.blue.shade50,
          suffixIcon: const Icon(Icons.search, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        onSubmitted: onSubmitted, // ⬅️ trigger fetch saat tekan enter
      ),
    );
  }
}

