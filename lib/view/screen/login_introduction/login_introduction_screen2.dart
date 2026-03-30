import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slider_button/slider_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginIntroductionScreen2 extends StatelessWidget {
  LoginIntroductionScreen2({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
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
            ),

            Align(
              alignment: AlignmentGeometry.xy(0, 0),
              child: SmoothPageIndicator(
              controller: controller,
              count: 4,
              onDotClicked: (index) {
                controller.jumpToPage(index);
              },
              effect: ColorTransitionEffect(dotColor: Colors.purple,
                  activeDotColor: Colors.white,
                  activeStrokeWidth: 15)
              )
            ),

            Positioned(
                bottom: 400,
                left: 120,
                right: 120,
                child: Container(
                  height: 180,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                  ),
                  child: Column(
                    children: [
                      Gap(20.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.dark_mode_outlined, color: Colors.black),
                          ),
                          Gap(30.0),

                          Column(
                            children: [
                              Text('Drink',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                              Gap(2.5),

                              Text('150 ml',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ]
                          )
                        ],
                      ),
                      Gap(10.0),

                      SizedBox(
                        height: 100,
                        child: BarChart(
                          BarChartData(
                            backgroundColor: Colors.purple,
                            minY: 10.0,
                            barGroups: [
                              BarChartGroupData(x: 10),
                              BarChartGroupData(x: 7),
                              BarChartGroupData(x: 2),
                              BarChartGroupData(x: 9),
                              BarChartGroupData(x: 16)
                            ],

                          ),
                          duration: Duration(milliseconds: 150), // Optional
                          curve: Curves.linear, // Optional
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}
