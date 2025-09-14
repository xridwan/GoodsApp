import 'package:flutter/material.dart';

import 'button_primary_widget.dart';
import 'button_red_widget.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback onAccept;
  final VoidCallback onCancel;

  const CustomDialogWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.onAccept,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 266,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonRedWidget(
                    text: 'Cancel',
                    fontSize: 14,
                    width: 90,
                    height: 35,
                    onPressed: onCancel,
                  ),
                  SizedBox(width: 12),
                  ButtonPrimaryWidget(
                    text: 'Logout',
                    fontSize: 14,
                    width: 90,
                    height: 35,
                    onPressed: onAccept,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
