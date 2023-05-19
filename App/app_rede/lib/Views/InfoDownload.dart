import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:app_rede/constants/constatsAppbar.dart';

import '../modelo_processo/Process_Model.dart';

class InfoDownload extends StatefulWidget {
  const InfoDownload({super.key});

  @override
  State<InfoDownload> createState() => _InfoDownloadState();
}

class _InfoDownloadState extends State<InfoDownload> {
  List<ProcessModel> textWidgets = [];
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  double convertToMb(String value) {
    double valor = 0;

    if (value.contains("KB")) {
      valor = double.parse((value).replaceAll("KB", "")) / (1000);
    } else if (value.contains("GB")) {
      valor = double.parse((value).replaceAll("GB", "")) * 1000;
    } else if (value.contains("MB")) {
      valor = double.parse((value).replaceAll("MB", ""));
    } else if (value.contains("B")) {
      valor = double.parse((value).replaceAll("B", "")) / (1000 * 1000);
    }
    return valor;
  }

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as List<ProcessModel>;
    final download =
        args.fold<double>(0, (sum, item) => sum + convertToMb(item.download));
    ;
    final updload =
        args.fold<double>(0, (sum, item) => sum + convertToMb(item.upload));
    ;

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
                  yValueMapper: (GDPData data, _) => data.upload,
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
            height: 5.h,
            onTap: (index) {
              print(index);
              if (index == 0) {
                Navigator.pushNamed(context, '/medirrede',
                    arguments: textWidgets);
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
      GDPData('Download', 2 ),
      GDPData('Update', 34),
    ];
    return chartData;
  }
}

double convertToMb(String value) {
  double valor = 0;

  if (value.contains("KB")) {
    valor = double.parse((value).replaceAll("KB", "")) / (1000);
  } else if (value.contains("GB")) {
    valor = double.parse((value).replaceAll("GB", "")) * 1000;
  } else if (value.contains("MB")) {
    valor = double.parse((value).replaceAll("MB", ""));
  } else if (value.contains("B")) {
    valor = double.parse((value).replaceAll("B", "")) / (1000 * 1000);
  }
  return valor;
}

class GDPData {
  GDPData(this.download, this.upload);
  final String download;
  final int upload;
}
