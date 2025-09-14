import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/widgets/status_chart_widget.dart';
import 'package:goods_app/presenter/widgets/status_item_widget.dart';

import '../../core/di/app_injection.dart';
import '../bloc/assetbystatus/asset_by_status_cubit.dart';
import '../bloc/assetbystatus/asset_by_status_state.dart';

class StatusAssetWidget extends StatelessWidget {
  const StatusAssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssetByStatusCubit(sl())..getAssetsByStatus(),
      child: BlocBuilder<AssetByStatusCubit, AssetByStatusState>(
        builder: (context, state) {
          if (state is AssetByStatusInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AssetByStatusLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AssetByStatusSuccess) {
            final data = state.assets;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox.square(dimension: 12),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: StatusItemWidget(
                        title: "Asset\nSold",
                        value: data[0].count.toString(),
                      ),
                    ),
                    Expanded(
                      child: StatusItemWidget(
                        title: "Asset in\nStock",
                        value: data[1].count.toString(),
                      ),
                    ),
                    Expanded(
                      child: StatusItemWidget(
                        title: "Expired\nAsset",
                        value: data[2].count.toString(),
                      ),
                    ),
                  ],
                ),
                SizedBox.square(dimension: 24),
                StatusChartWidget(list: data),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
