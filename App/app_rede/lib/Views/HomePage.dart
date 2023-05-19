import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

import 'package:app_rede/Views/InfoDownload.dart';
import 'package:app_rede/constants/constatsAppbar.dart';

import '../back_end/conexao_rede.dart';
import '../modelo_processo/Process_Model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //<process model>
  //argumensts em navigator para passar os dados
  //em tela especifuica usar a variavel arqs
  //dados:process model, passar para as telas:textwidget
  List<ProcessModel> textWidgets = [];
  final StreamController<String> streamController = StreamController<String>();
  double _sumDataValue = 0;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    connect2(streamController);
  }

  // Function to convert one String net data to one double MB value
  double convertToMb(String value) {
    double valor = 0;

    if (value.contains("KB")) {
      valor = double.parse((value).replaceAll("KB", "")) / (1000);
    } else if (value.contains("GB")) {
      valor = double.parse((value).replaceAll("GB", "")) * 1000;
    } else if (value.contains("MB")) {
      valor = double.parse((value).replaceAll("MB", ""));
    } else if (value.contains("B")) {
      valor = double.parse((value).replaceAll("B", "")) / (1000 * 1000);
    }
    return valor;
  }

  saveDataUsed(List<ProcessModel> lista) async {
    double total = await lista.fold<double>(
        0,
        (sum, item) =>
            sum + convertToMb(item.upload) + convertToMb(item.download));
    print(total);
    setState(
      () {
        _sumDataValue = total * 10;
      },
    );
  }

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
            height: 45.h,
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
                SizedBox(
                  child: StreamBuilder<String>(
                      stream: streamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.connectionState ==
                                ConnectionState.active) {
                          textWidgets = [];
                          var data = snapshot.data;
                          //print(data);
                          if (data != null) {
                            Map<String, dynamic> jsonCodeC = jsonDecode(data);
                            for (var element in jsonCodeC.values) {
                              textWidgets.add(ProcessModel(
                                name: element["name"],
                                upload: element["upload"],
                                download: element["download"],
                              ));
                             // textWidgets.add(element["upload"]);
                              //textWidgets.add(element["download"]);
                                
                            }
                          }
                          //print(textWidgets);
                          Future.delayed(Duration.zero, () {
                            saveDataUsed(textWidgets);
                          });
                          return SizedBox();
                        } else {
                          return SizedBox();
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Text(
                    'Dados consumidos',
                    style: GoogleFonts.abel(
                        fontSize: 30, fontWeight: FontWeight.w200),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Center(
                    child: CircularPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      radius: 120,
                      lineWidth: 35,
                      percent: _sumDataValue/100 ,
                      progressColor: Colors.tealAccent.shade700,
                      backgroundColor: Colors.tealAccent,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        _sumDataValue.toStringAsFixed(6),
                        style: TextStyle(
                            fontSize: 40, color: Colors.tealAccent.shade700),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.h,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/medirrede',
                          arguments: textWidgets);
                    },
                    child: Text(
                      'Mais detalhes',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent.shade700,
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(1.h),
                  height: 10.h,
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
