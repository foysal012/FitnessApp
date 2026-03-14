import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'reset_password_success_screen.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  final TextEditingController newPasswordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();

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

                Text('Create new\npassword',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(10.0),

                Text('Your new password must be unique from those\npreviously used.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(40.0),

                TextFormField(
                  controller: newPasswordTextController,
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
                    hintText: 'New Password',
                    enabled: true,
                  )
                ),
                Gap(15.0),

                TextFormField(
                  controller: confirmPasswordTextController,
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
                    hintText: 'Confirm Password',
                    enabled: true,
                  )
                ),
                Gap(60.0),

                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPasswordSuccessScreen())),
                  child: Container(
                    height: 48,
                    alignment: AlignmentGeometry.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                    ),
                    child: Text('Reset Password',
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
