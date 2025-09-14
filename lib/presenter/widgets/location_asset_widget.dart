import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/widgets/status_item_widget.dart';

import '../../core/di/app_injection.dart';
import '../bloc/assetbyloc/asset_by_loc_cubit.dart';
import '../bloc/assetbyloc/asset_by_loc_state.dart';
import 'location_cart_widget.dart';

class LocationAssetWidget extends StatelessWidget {
  const LocationAssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssetByLocCubit(sl())..getAssetsByLocation(),
      child: BlocBuilder<AssetByLocCubit, AssetByLocState>(
        builder: (context, state) {
          if (state is AssetByLocInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AssetByLocLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AssetByLocSuccess) {
            final data = state.assets;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox.square(dimension: 12),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: StatusItemWidget(
                        title: "Gudang",
                        value: data[0].count.toString(),
                      ),
                    ),
                    Expanded(
                      child: StatusItemWidget(
                        title: "Rak Penjualan",
                        value: data[1].count.toString(),
                      ),
                    ),
                  ],
                ),
                SizedBox.square(dimension: 24),
                LocationChartWidget(list: data),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
