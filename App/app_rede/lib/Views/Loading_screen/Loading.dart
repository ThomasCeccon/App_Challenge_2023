import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LoadingTela extends StatefulWidget {
  const LoadingTela({super.key});

  @override
  State<LoadingTela> createState() => _LoadingTelaState();
}

class _LoadingTelaState extends State<LoadingTela>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      body: Center(
        child: Lottie.network(
          "https://assets6.lottiefiles.com/packages/lf20_rLfMZE.json",
          controller: _controller,
        ),
      ),
    );
  }
}
