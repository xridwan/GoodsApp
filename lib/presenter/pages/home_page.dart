import 'package:flutter/material.dart';

import '../widgets/location_asset_widget.dart';
import '../widgets/status_asset_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusAssetWidget(),
              SizedBox.square(dimension: 24),
              LocationAssetWidget(),
              SizedBox.square(dimension: 48),
            ],
          ),
        ),
      ),
    );
  }
}
