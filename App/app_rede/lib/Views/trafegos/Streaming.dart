import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/modelo_processo/Process_Model.dart';

class StreamingVideo extends StatefulWidget {
  const StreamingVideo({super.key});

  @override
  State<StreamingVideo> createState() => _StreamingVideoState();
}

class _StreamingVideoState extends State<StreamingVideo> {
  List<ProcessModel> textWidgets = [];
 
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        body: SingleChildScrollView(
          child: Column(children: [
            //rede streaming
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Text(
                'Streaming',
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
                  percent: 0.4,
                  progressColor: Colors.tealAccent.shade700,
                  backgroundColor: Colors.tealAccent,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    '40 Mb',
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
                  Navigator.pushNamed(context, '/medirapps',arguments: textWidgets);
                },
                child: Text('Detalhes',style: GoogleFonts.battambang(fontSize: 15),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, elevation: 10),
              ),
            )
          ]),
        ),
      );
    });
  }
}
