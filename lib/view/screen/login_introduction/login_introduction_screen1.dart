import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slider_button/slider_button.dart';

class LoginIntroductionScreen1 extends StatelessWidget {
  const LoginIntroductionScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              // color: Color(0xff504158)
            image: DecorationImage(image: AssetImage('assets/image/intro_screen.jpg'), fit: BoxFit.fill)
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50.0),

                Text('Start your\nfitness Journey!',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),
                ),
                Gap(10.0),

                Text('Start your fitness journey\nwith our app\'s guidance and support',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline
                  )
                ),
                Gap(400.0),

                SliderButton(
                  action: () async {
                    // return true; //return false if you want to avoid dismissing the widget in the tree.
                  },
                  label: Text(
                    "Lets start",
                    style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  icon: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 30.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      )),
                  width: 400,
                  radius: 50,
                  buttonColor: Color(0xffffffff),
                  backgroundColor: Color(0xff0000D5),
                  highlightedColor: Colors.white,
                  baseColor: Colors.red,
                ),
              ],
            ),
          ),
        )
    );
  }
}
