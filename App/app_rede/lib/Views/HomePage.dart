import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/constants/constatsAppbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        //app bat
        appBar: appBar('homepage'),

        //corpo da pagina inicial
        body: Center(
          child: Container(
            width: 87.w,
            height: 78.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.teal[100],
              boxShadow: [
                BoxShadow(
                    color: Colors.teal.shade300,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    'Dados consumidos no mês',
                    style: GoogleFonts.abel(
                        fontSize: 30, fontWeight: FontWeight.w200),
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
                        '40 GB',
                        style: TextStyle(
                            fontSize: 40, color: Colors.tealAccent.shade700),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 3.h,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/medirrede');
                    },
                    child: Text(
                      'Mais detalhes',
                      style: GoogleFonts.battambang(fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent.shade700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(1.h),
                  height: 12.h,
                  child: Image.asset('assets/images/colaboradores.png'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
