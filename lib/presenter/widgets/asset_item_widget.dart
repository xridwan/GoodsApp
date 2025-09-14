import 'package:flutter/material.dart';
import 'package:goods_app/data/response/asset_list_response.dart';

class AssetItemWidget extends StatelessWidget {
  final AssetItem asset;
  final VoidCallback? onTap;

  const AssetItemWidget({super.key, this.onTap, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Asset Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox.square(dimension: 4),
                    Text(
                      asset.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Image.asset(
                  'assets/images/button_trigger_only_icon.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
        SizedBox.square(dimension: 8),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }
}
