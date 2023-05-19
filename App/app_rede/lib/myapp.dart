import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_rede/Views/Configuracoes.dart';
import 'package:app_rede/Views/HomePage.dart';
import 'package:app_rede/Views/InfoDownload.dart';
import 'package:app_rede/Views/InfoNavegandonet.dart';
import 'package:app_rede/Views/InfoRede.dart';
import 'package:app_rede/Views/Loading_screen/Loading.dart';
//import 'package:app_rede/Views/Loading_screen/Loading.dart';
import 'package:app_rede/Views/MedirApps.dart';
import 'package:app_rede/Views/MedirRede.dart';
import 'package:app_rede/Views/trafegos/Downloads.dart';
import 'package:app_rede/Views/trafegos/NavegaInternet.dart';
import 'package:app_rede/Views/trafegos/Streaming.dart';

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
        '/streamingvideo': (context) => const StreamingVideo(),
        '/navegacaointernet': (context) => const NavegacaoInternet(),
        '/download': (context) => Downloads(10),
        '/loadingtela': (context) => const LoadingTela(),
        '/inforede': (context) => const InfoRede(),
        '/config': (context) => const Configuracao(),
        '/infodownload': (context) => InfoDownload(),
        '/infonavegandonet': ((context) => InfoNavegandoNet())
      },
    );
  }
}
