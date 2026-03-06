import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../resources/app_image/app_image.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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

          Container(
            alignment: Alignment(0, 0.70),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 52,
                  alignment: AlignmentGeometry.center,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xff494358)
                  ),
                  child: Text('Login',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),
                  ),
                ),
                Gap(15.0),

                Container(
                  height: 52,
                  alignment: AlignmentGeometry.center,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white
                  ),
                  child: Text('Register',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff494358)
                    ),
                  ),
                ),
                Gap(15.0),

                Text('Continue as a guest',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
