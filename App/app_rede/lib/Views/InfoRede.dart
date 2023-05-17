import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';

import '../constants/constatsAppbar.dart';

class InfoRede extends StatefulWidget {
  const InfoRede({super.key});

  @override
  State<InfoRede> createState() => _InfoRedeState();
}

class _InfoRedeState extends State<InfoRede> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: appBar('info rede'),
        body: Column(
          children: [Text('rede')],
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
