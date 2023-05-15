import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
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
        body: SizedBox(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: 2.h),
                  child: Container(
                    width: 80.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        border:
                            Border.all(width: 1.5, color: Colors.blueAccent),
                        color: Colors.blue.shade100),
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, '/medirrede');
                      }),
                      child: Text(
                        "Tráfego",
                        style: GoogleFonts.battambang(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Container(
                    width: 80.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        border:
                            Border.all(width: 1.5, color: Colors.blueAccent),
                        color: Colors.blue.shade100),
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, '/medirapps');
                      }),
                      child: Text(
                        "Medir apps",
                        style: GoogleFonts.battambang(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Container(
                    width: 80.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        border:
                            Border.all(width: 1.5, color: Colors.blueAccent),
                        color: Colors.blue.shade100),
                    child: TextButton(
                      onPressed: (() {}),
                      child: Text(
                        "Outras informações",
                        style: GoogleFonts.battambang(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
