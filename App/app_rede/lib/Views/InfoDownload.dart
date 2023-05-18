import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:app_rede/constants/constatsAppbar.dart';

class InfoDownload extends StatefulWidget {
  const InfoDownload({super.key});

  @override
  State<InfoDownload> createState() => _InfoDownloadState();
}

class _InfoDownloadState extends State<InfoDownload> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan.shade100,
          appBar: appBar('info downloads'),
          body: Center(
            child: SfCircularChart(
              title: ChartTitle(
                  text: 'Download e Upload',
                  textStyle: GoogleFonts.roboto(fontSize: 30)),
              legend: Legend(
                  isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                PieSeries<GDPData, String>(
                  dataSource: _chartData,
                  xValueMapper: (GDPData data, _) => data.download,
                  yValueMapper: (GDPData data, _) => data.update,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                  ),
                  enableTooltip: true,
                ),
              ],
            ),
          ),

          //bottombar
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.cyan.shade100,
            color: Colors.tealAccent.shade400,
            animationDuration: Duration(microseconds: 300),
            height: 9.h,
            onTap: (index) {
              print(index);
              if (index == 0) {
                Navigator.pushNamed(context, '/medirrede');
              }
            },
            items: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
    });
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      //json download e upload
      GDPData('Download', 2),
      GDPData('Update', 34),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.download, this.update);
  final String download;
  final int update;
}
