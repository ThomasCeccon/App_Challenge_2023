import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/constants/constatsAppbar.dart';

class MedirRede extends StatefulWidget {
  const MedirRede({super.key});

  @override
  State<MedirRede> createState() => _MedirRedeState();
}

class _MedirRedeState extends State<MedirRede> {

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: appBar('medir rede'),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Text(
                'Rede privada',
                style:
                    GoogleFonts.abel(fontSize: 30, fontWeight: FontWeight.w200),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
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
  
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.cyan.shade100,
          color: Colors.tealAccent.shade400,
          animationDuration: Duration(microseconds: 300),
          height: 9.h,
          onTap: (index) {
            print(index);
            if (index == 0) {
              Navigator.pushNamed(context, '/homepage');
            } else if (index == 1) {
            } else {}
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.add,
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
