import 'package:fitnessapp/view/screen/splash/splash_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../resources/app_image/app_image.dart';
import '../introduction/introduction_screen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {

  @override
  void initState() {
    super.initState();
    navigationCheck();
  }

  Future<void> navigationCheck() async{
    await Future.delayed(Duration(seconds: 2));
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashScreen2()));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroductionScreen()));
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
