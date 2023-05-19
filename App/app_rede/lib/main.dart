import 'dart:io';

import 'package:flutter/material.dart';

import 'package:window_manager/window_manager.dart';

import 'package:app_rede/myapp.dart';

void main() {
  runApp(MyApp());
  
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1200, 700));
    WindowManager.instance.setMaximumSize(const Size(1200, 700));
  }
}
