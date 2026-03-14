import 'package:fitnessapp/view/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController emailTextController = TextEditingController();

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

                Text('Forgot Password?',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(10.0),

                Text('Don\'t worry! It occours. Please enter the email\naddress linked with your account.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(20.0),

                TextFormField(
                  controller: emailTextController,
                  decoration: InputDecoration(
                    fillColor: Color(0xff786283),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide.none
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide.none
                    ),
                    hintText: 'Email',
                    enabled: true,

                  ),
                ),
                Gap(30.0),

                Container(
                  height: 48,
                  alignment: AlignmentGeometry.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  child: Text('Send Code',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff504158),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
               Gap(400),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Remember Password?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                    Gap(5.0),

                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen())),
                      child: Text('Login',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffe4b27f)
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(30.0),
              ],
            ),
          ),
        )
    );
  }
}
