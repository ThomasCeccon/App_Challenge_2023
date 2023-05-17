import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/Repositories_apps/Infoapp_repositories.dart';
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
    final tabela = Infoapp_repositories
        .tabela; //aceesando e recebendo os valores para tabela

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: appBar('medir app'),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int Infoapp) {
              return ListTile(
                leading: Image.asset(tabela[Infoapp].icone),
                title: Text(tabela[Infoapp].nome),
                trailing: Text(tabela[Infoapp].dados_uso.toString()),
              );
            },
            padding: EdgeInsets.all(5.w),
            separatorBuilder: (_, ___) => Divider(height: 4.h),
            itemCount: tabela.length),
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
