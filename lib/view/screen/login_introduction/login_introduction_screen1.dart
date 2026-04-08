import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:slider_button/slider_button.dart';
import 'package:swipeable_button_flutter/swipebutton.dart';
import 'login_introduction_screen2.dart';

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

                // SliderButton(
                //   // action: () async => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIntroductionScreen2())),
                //   action: () async {
                //    return false;
                //   },
                //   label: Text(
                //     "Lets start",
                //     style: TextStyle(
                //         color: Color(0xff4a4a4a),
                //         fontWeight: FontWeight.w500,
                //         fontSize: 17),
                //   ),
                //   icon: Center(
                //       child: Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         color: Colors.black,
                //         size: 30.0,
                //         semanticLabel: 'Text to announce in accessibility modes',
                //       )),
                //   width: 400,
                //   radius: 50,
                //   buttonColor: Color(0xffffffff),
                //   backgroundColor: Color(0xff0000D5),
                //   highlightedColor: Colors.white,
                //   baseColor: Colors.red,
                // ),

                ///

                // Center(
                //   child: GradientSlideToAct(
                //     width: 400,
                //     text: 'Slide to Go',
                //     textStyle: TextStyle(color: Colors.white,fontSize: 15),
                //     backgroundColor: Color(0Xff172663),
                //     onSubmit: () async{
                //       debugPrint("Submitted!");
                //       await Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIntroductionScreen2()));
                //     },
                //
                //     gradient: const LinearGradient(
                //         begin: Alignment.topLeft,
                //         end: Alignment.bottomRight,
                //         colors: [
                //           Color(0xff0da6c2),
                //           Color(0xff0E39C6),
                //         ]
                //     ),
                //   ),
                // ),
                ///
                Center(
                  child: SwipeButton(
                    text: "Submit",
                    // onSwipeCallback: () {
                    //   print("Swiped - Perform some operation");
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIntroductionScreen2()));
                    // },
                    onSwipeCallback: () async {
                      print("Swiped - Perform some operation");

                      await Future.delayed(Duration(milliseconds: 300));

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginIntroductionScreen2(),
                        ),
                      );
                    },
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
