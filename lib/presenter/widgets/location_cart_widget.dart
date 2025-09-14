import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:goods_app/data/response/asset_by_location_response.dart';

import '../../data/response/asset_by_status_response.dart';

class LocationChartWidget extends StatefulWidget {
  final List<AssetByLocationResponse> list;

  const LocationChartWidget({super.key, required this.list});

  @override
  State<LocationChartWidget> createState() => _LocationChartWidgetState();
}

class _LocationChartWidgetState extends State<LocationChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BarChart(
          BarChartData(
            maxY: _getMaxY(),
            alignment: BarChartAlignment.spaceEvenly,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipRoundedRadius: 8,
                tooltipPadding: const EdgeInsets.all(8),
                tooltipMargin: 8,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  final statusName = widget.list[group.x.toInt()].location?.name;
                  return BarTooltipItem(
                    '$statusName\n',
                    const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: rod.toY.toString(),
                        style: TextStyle(
                          color: rod.gradient?.colors.first ?? rod.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            barGroups: _chartGroups(),
            borderData: FlBorderData(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                  width: 1,
                ),
                left: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
            gridData: const FlGridData(
              drawHorizontalLine: false,
              drawVerticalLine: false,
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      widget.list[value.toInt()].location?.name ?? "-",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 5,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return List.generate(widget.list.length, (index) {
      final count = widget.list[index].count?.toDouble() ?? 0.0;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: count,
            width: 18,
            gradient: const LinearGradient(
              colors: [Colors.greenAccent, Colors.blueAccent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ],
      );
    });
  }

  double _getMaxY() {
    final maxValue = widget.list
        .map((e) => e.count ?? 0)
        .reduce((a, b) => a > b ? a : b);
    return maxValue + 5 > 25 ? 25.0 : (maxValue + 5).toDouble();
  }

}
