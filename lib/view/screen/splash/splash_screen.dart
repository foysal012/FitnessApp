import 'package:fitnessapp/view/screen/Home/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/app_image/app_image.dart';
import '../introduction/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigationCheck();
  }

  bool isFirstTime = true;

  Future<void> getValue() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isFirstTime = sharedPreferences.getBool('isFirstTime')??true;
  }

  Future<void> navigationCheck() async{
    await Future.delayed(Duration(seconds: 2));
    await getValue();
    if (isFirstTime== true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroductionScreen()));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImage.splashImage1), fit: BoxFit.fill)
            ),
          ),

          Positioned(
              right: 150.0,
              left: 160.0,
              bottom: 380.0,
              child: Text('Fitness App',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
          ),

          Positioned(
              right: 150.0,
              left: 160.0,
              bottom: 180.0,
              child: CupertinoActivityIndicator(
                radius: 15.0,
                color: Colors.white
              )
          ),

          Positioned(
              right: 100.0,
              left: 100.0,
              bottom: 120.0,
              child: Column(
                children: [
                  Text('Design & Developed by',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white
                    ),
                  ),
                  Text('Md. Foysal Joarder',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ],
              )
          ),
        ],
      )
    );
  }
}
