import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:app_rede/Views/trafegos/Downloads.dart';
import 'package:app_rede/Views/trafegos/NavegaInternet.dart';
import 'package:app_rede/Views/trafegos/Streaming.dart';
import 'package:app_rede/constants/constatsAppbar.dart';

import '../modelo_processo/Process_Model.dart';

class MedirRede extends StatefulWidget {
  const MedirRede({super.key});

  @override
  State<MedirRede> createState() => _MedirRedeState();
}

class _MedirRedeState extends State<MedirRede> {
  List<ProcessModel> textWidgets = [];
  final _controller = PageController();
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
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as List<ProcessModel>;
    final download =
        args.fold<double>(0, (sum, item) => sum + convertToMb(item.download));
    ;

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: appBar('medir rede'),
        body: Column(
          children: [
            SizedBox(
              height: 40.h,
              child: PageView(
                controller: _controller,
                children: [
                  NavegacaoInternet(),
                  StreamingVideo(),
                  Downloads(download),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: JumpingDotEffect(
                  activeDotColor: Colors.teal,
                  dotColor: Colors.teal.shade100,
                  dotHeight: 20,
                  dotWidth: 20,
                  spacing: 20,
                  verticalOffset: 5),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.cyan.shade100,
          color: Colors.tealAccent.shade400,
          animationDuration: Duration(microseconds: 300),
          height: 5.h,
          onTap: (index) {
            print(index);
            if (index == 0) {
              Navigator.pushNamed(context, '/homepage');
            }
            if (index == 1) {
              Navigator.pushNamed(context, '/inforede');
            }
            if (index == 2) {
              Navigator.pushNamed(context, '/config');
            }
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.wifi,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
