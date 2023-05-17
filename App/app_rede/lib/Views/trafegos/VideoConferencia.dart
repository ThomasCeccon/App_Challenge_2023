import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';


class VideoConferencia extends StatefulWidget {
  const VideoConferencia({super.key});

  @override
  State<VideoConferencia> createState() => _VideoConferenciaState();
}

class _VideoConferenciaState extends State<VideoConferencia> {
  @override
  Widget build(BuildContext context) {
     return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
       backgroundColor: Colors.cyan.shade100,
        body: Column(children: [
          //rede video conferencia
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              'Video conferência',
              style:
                  GoogleFonts.abel(fontSize: 35, fontWeight: FontWeight.w200),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
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
                EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 5.h),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Detalhes'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, elevation: 10),
            ),
          )
        ]),
      );
    });
  }
}