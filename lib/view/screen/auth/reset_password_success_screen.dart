import 'package:fitnessapp/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  ResetPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color(0xff504158)
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50.0),

                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 2.0
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                  ),
                ),
                Gap(100.0),

                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/lottie/success.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),

                      Text('Password Changed!',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),
                      ),
                      Gap(10.0),

                      Text('Your password has been changed\nsuccessfully',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white54,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Gap(60.0),

                GestureDetector(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false),
                  child: Container(
                    height: 48,
                    alignment: AlignmentGeometry.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                    ),
                    child: Text('Back to Login',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff504158),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
