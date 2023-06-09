import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../data_grafico-net/Data.dart';

class MyLineChart extends StatelessWidget {
    final List<ChartData> points;
  const MyLineChart(this.points,{super.key});

  @override
  Widget build(BuildContext context) {
     return AspectRatio(
      aspectRatio: 1,
      child: LineChart(LineChartData(
        lineBarsData: [
          LineChartBarData(
            barWidth: 5,
            color: Colors.white,
            spots: points.map((point)=> FlSpot(point.x, point.y)).toList(),
            dotData: FlDotData(show: true),
            
          ),
        ]
      )),
    );
    return Scaffold();
  }
}