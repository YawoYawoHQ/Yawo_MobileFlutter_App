import 'package:flutter/material.dart';


class YawoSplashScreen extends StatefulWidget {
  const YawoSplashScreen({super.key});

  @override
  State<YawoSplashScreen> createState() => _YawoSplashScreenState();
}

class _YawoSplashScreenState extends State<YawoSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash Screen"),),
    );
  }
}
