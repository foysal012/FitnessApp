import 'package:fitnessapp/view/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'create_new_password_screen.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({super.key});

  final TextEditingController otp1TextController = TextEditingController();
  final TextEditingController otp2TextController = TextEditingController();
  final TextEditingController otp3TextController = TextEditingController();
  final TextEditingController otp4TextController = TextEditingController();

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

                Text('OTP Verification',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(10.0),

                Text('Enter the verification code we just sent on your\n email address.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(40.0),

                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 15.0,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: otp1TextController,
                        decoration: InputDecoration(
                          fillColor: Color(0xff786283),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.white
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          hintText: 'A',
                          enabled: true,
                      
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextFormField(
                        controller: otp2TextController,
                        decoration: InputDecoration(
                          fillColor: Color(0xff786283),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          hintText: 'X',
                          enabled: true,
                      
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextFormField(
                        controller: otp3TextController,
                        decoration: InputDecoration(
                          fillColor: Color(0xff786283),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          hintText: 'Y',
                          enabled: true,
                      
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextFormField(
                        controller: otp4TextController,
                        decoration: InputDecoration(
                          fillColor: Color(0xff786283),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          hintText: 'Z',
                          enabled: true,
                      
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(60.0),

                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewPasswordScreen())),
                  child: Container(
                    height: 48,
                    alignment: AlignmentGeometry.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                    ),
                    child: Text('Verify',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff504158),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Gap(30),

                Center(
                  child: Text('Time Remaining: 6:00',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
                Gap(320),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t received code?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                    Gap(5.0),

                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen())),
                      child: Text('Resend',
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
