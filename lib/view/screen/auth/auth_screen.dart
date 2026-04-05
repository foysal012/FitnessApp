import 'package:fitnessapp/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/app_image/app_image.dart';
import 'signup_screen.dart';

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
            alignment: Alignment(0, 0.85),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())),
                  child: Container(
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
                ),
                Gap(15.0),

                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen())),
                  child: Container(
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
                ),
                Gap(15.0),

                Text('Continue as a guest',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),
                ),
                Gap(15.0),

                Text('© 2026 Foysal. All right reserved.',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
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
