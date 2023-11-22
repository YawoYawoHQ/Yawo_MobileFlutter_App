import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/screen/walkthrough/walk_through_screens.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../util/constants/colors.dart';
import '../../util/constants/images_path.dart';
import '../auth_screens/signin_screen.dart';


class YawoSplashScreen extends StatefulWidget {
  const YawoSplashScreen({super.key});

  @override
  State<YawoSplashScreen> createState() => _YawoSplashScreenState();
}

class _YawoSplashScreenState extends State<YawoSplashScreen> {

  double imageHeight = 60.0;
  double imageWidth = 60.0;
  double textOpacity = 0.0;
  double textFontSize = 0.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // Check if 's the first launch
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isFirstLaunch = pref.getBool('first_launch') ?? true;

    // If it's the first launch, show splash and navigate to walkthrough
    if(isFirstLaunch){
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        imageHeight = 100.0;
        imageWidth = 100.0;
        textOpacity = 1.0;
        textFontSize = 28.0;
      });

      await Future.delayed(const Duration(seconds: 1));

      pref.setBool('first_launch', false);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const YawoWalkThrough()),
      );
    } else {
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        imageHeight = 100.0;
        imageWidth = 100.0;
        textOpacity = 1.0;
        textFontSize = 28.0;
      });

      await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen() )
      );

    }
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: bgNeutralColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: Container(
        height: context.height(),
        color: mainColor,
        child: Stack(
          children: [
            // Positioned(
            //   bottom: -60,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 3,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(yawo_logo),
            //         fit: BoxFit.fitWidth,
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: imageHeight,
                    width: imageWidth,
                    child: Image.asset(
                      yawo_logo,
                      fit: BoxFit.cover,
                    ).center(),
                  ),
                  10.height,
                  AnimatedOpacity(
                    opacity: textOpacity,
                    duration: const Duration(seconds: 1),
                    child: Text("Yawo Yawo", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
