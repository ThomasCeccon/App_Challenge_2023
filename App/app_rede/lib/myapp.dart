import 'package:flutter/material.dart';

import 'package:app_rede/Views/HomePage.dart';
import 'package:app_rede/Views/MedirApps.dart';
import 'package:app_rede/Views/MedirRede.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: '/homepage',

    routes: {
      '/homepage':(context) => const HomePage(),
      '/medirrede':(context) => const MedirRede(),
       '/medirapps':(context) => const MedirApps(),
      
    },
    );
  }
}