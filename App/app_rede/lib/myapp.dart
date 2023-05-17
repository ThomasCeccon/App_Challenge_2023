import 'package:flutter/material.dart';

import 'package:app_rede/Views/Configuracoes.dart';
import 'package:app_rede/Views/HomePage.dart';
import 'package:app_rede/Views/InfoRede.dart';
import 'package:app_rede/Views/Loading_screen/Loading.dart';
//import 'package:app_rede/Views/Loading_screen/Loading.dart';
import 'package:app_rede/Views/MedirApps.dart';
import 'package:app_rede/Views/MedirRede.dart';
import 'package:app_rede/Views/trafegos/Downloads.dart';
import 'package:app_rede/Views/trafegos/NavegaInternet.dart';
import 'package:app_rede/Views/trafegos/RedePrivada.dart';
import 'package:app_rede/Views/trafegos/Streaming.dart';
import 'package:app_rede/Views/trafegos/VideoConferencia.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => const HomePage(),
        '/medirrede': (context) => const MedirRede(),
        '/medirapps': (context) => const MedirApps(),
        '/redeprivada': (context) => RedePrivada(),
        '/streamingvideo': (context) => const StreamingVideo(),
        '/videoconferencia': (context) => const VideoConferencia(),
        '/navegacaointernet': (context) => const NavegacaoInternet(),
        '/downloadss': (context) => const Downloads(),
        '/loadingtela': (context) => const LoadingTela(),
        '/inforede':(context) => const InfoRede(),
        '/config':(context) => const Configuracao(),
        //'/conexaorede':(context) => const (),
      },
    );
  }
}
