import 'package:fitnessapp/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController userTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
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
                Gap(50.0),

                Container(
                    height: 50,
                    width: 50,
                    alignment: AlignmentGeometry.center,
                    padding: EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2.0,
                            color: Colors.white
                        )
                    ),
                    child: Icon(Icons.close, color: Colors.white, size: 40)),
                Gap(10.0),

                Text('Hello! Register to get\nstarted',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(10.0),

                TextFormField(
                  controller: userTextController,
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
                    hintText: 'Username',
                    enabled: true,

                  ),
                ),
                Gap(15.0),

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
                Gap(15.0),

                TextFormField(
                  controller: passwordTextController,
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
                      hintText: 'Password',
                      enabled: true,
                      suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.visibility, color: Colors.white)
                      )
                  ),
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
                      hintText: 'Confirm password',
                      enabled: true,
                      suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.visibility, color: Colors.white)
                      )
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
                  child: Text('Register',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff504158),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Gap(200.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                    Gap(5.0),

                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())),
                      child: Text('Login Now',
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
