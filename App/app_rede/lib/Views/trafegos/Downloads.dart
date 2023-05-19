import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../back_end/conexao_rede.dart';
import '../../modelo_processo/Process_Model.dart';

class Downloads extends StatefulWidget {
  Downloads(this.download, {super.key});
  double download;

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  List<ProcessModel> textWidgets = [];

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //final download =args[textWidgets];

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        body: Column(children: [

          //rede downloads
          Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Text(
              'Downloads',
              style:
                  GoogleFonts.abel(fontSize: 35, fontWeight: FontWeight.w200),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Center(
              child: CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: 120,
                lineWidth: 35,
                percent: widget.download / 10,
                progressColor: Colors.tealAccent.shade700,
                backgroundColor: Colors.tealAccent,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  widget.download.toStringAsFixed(6),
                  style: TextStyle(
                      fontSize: 40, color: Colors.tealAccent.shade700),
                ),
              ),
            ),
          ),

          //medir rede privada

          Padding(
            padding:
                EdgeInsets.only(top: 4.h, left: 5.w, right: 5.w, bottom: 1.h),
            child: ElevatedButton(
              onPressed: () {
                //final args
                //argumts:textwidget
                Navigator.pushNamed(context, '/infodownload',
                    arguments: textWidgets);
              },
              child: Text(
                'Detalhes',
                style: GoogleFonts.battambang(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, elevation: 10),
            ),
          )
        ]),
      );
    });
  }
}
