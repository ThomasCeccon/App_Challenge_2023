import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/DadosConfig/InfoConfig.dart';
import 'package:app_rede/Repositories_config/infoaconfig_repositories.dart';
import 'package:app_rede/constants/constatsAppbar.dart';

class Configuracao extends StatefulWidget {
  const Configuracao({super.key});

  @override
  State<Configuracao> createState() => _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  @override
  Widget build(BuildContext context) {
    final tabelas = InfoConfigRepositories
        .tabelas; //aceesando e recebendo os valores para tabela
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: appBar('configuracoes'),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int InfoConfig) {
              return ListTile(
                leading: Image.asset(tabelas[InfoConfig].icone),
                title: Text(tabelas[InfoConfig].nome),
                trailing: IconButton(tooltip: tabelas[InfoConfig].navegar, icon: Icon(Icons.keyboard_arrow_right), onPressed: () {  },),
              );
            },
            padding: EdgeInsets.all(2.w),
            separatorBuilder: (_, ___) => Divider(
                  height: 2.h,
                ),
            itemCount: tabelas.length),
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
