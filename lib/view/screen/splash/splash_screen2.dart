import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../resources/app_image/app_image.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    super.initState();
    // navigationCheck();
  }

  Future<void> navigationCheck() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashScreen2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppImage.splashImage2), fit: BoxFit.fill)
              ),
            ),

            Positioned(
                right: 150.0,
                left: 160.0,
                bottom: 100.0,
                child: CupertinoActivityIndicator(
                    radius: 15.0,
                    color: Colors.white
                )
            ),

            Positioned(
                right: 100.0,
                left: 100.0,
                bottom: 60.0,
                child: Column(
                  children: [
                    Text('© 2026 Foysal. All right reserved.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    )
                  ],
                )
            ),
          ],
        )
    );
  }
}
