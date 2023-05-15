import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';


class RedePrivada extends StatefulWidget {
  const RedePrivada({super.key});

  @override
  State<RedePrivada> createState() => _RedePrivadaState();
}

class _RedePrivadaState extends State<RedePrivada> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
           backgroundColor: Colors.cyan.shade100,
        body: Column(children: [
          //rede pessoal
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              'Rede privada',
              style:
                  GoogleFonts.abel(fontSize: 30, fontWeight: FontWeight.w200),
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
              child: Text('Medir'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, elevation: 10),
            ),
          )
        ]),
      );
    });
  }
}