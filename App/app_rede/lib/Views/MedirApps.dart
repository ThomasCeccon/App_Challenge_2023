

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/constants/constatsAppbar.dart';

class MedirApps extends StatefulWidget {
  const MedirApps({super.key});

  @override
  State<MedirApps> createState() => _MedirAppsState();
}

class _MedirAppsState extends State<MedirApps> {
  //controlar o tipo de entrada
  final _textController = TextEditingController();

  String userPost = '';
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: appBar('medir app'),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 2.h,left: 5.w,right: 5.w),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Digite o app",
                   isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ), //apagar palavra
                ),
              ),
            ),
            Container(
              child: Center(child: Text(userPost)),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  userPost = _textController.text;
                });
              },
              color: Colors.blue,
              child: Text(
                'post',
                style: TextStyle(color: Colors.white),
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
