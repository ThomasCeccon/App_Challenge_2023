import 'dart:math';

import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/components_grafico/charts/line_chart.dart';
import 'package:app_rede/constants/constatsAppbar.dart';
import 'package:app_rede/data_grafico-net/Data.dart';

class InfoNavegandoNet extends StatefulWidget {
  const InfoNavegandoNet({super.key});

  @override
  State<InfoNavegandoNet> createState() => _InfoNavegandoNetState();
}

class _InfoNavegandoNetState extends State<InfoNavegandoNet> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: appBar('info navegando net'),
        body: Padding(
          padding:  EdgeInsets.only(top:6.h,bottom: 6.h),
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                Container(
                //  width: 90.w,
                 // height: 100.h,
                  margin: EdgeInsets.all(7.h),
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.teal[100],
                      border: Border.all(
                    color: Colors.teal,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top:1.h,bottom:1.h),
                      child: Text("Navegação Internet",style:GoogleFonts.abel(fontSize: 30,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20,),
                    MyLineChart(chartData),
                  ]),
                  
                ),
              ]),
            ),
          ),
        ),
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
      );
    });
  }
}
