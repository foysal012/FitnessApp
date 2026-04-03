import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/introduction_screen_widget.dart';
import '../Home/home_screen/home_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {

  List<Widget> bodyList = [
    IntroductionScreenWidget(
      title: "Welcome",
      subTitle: "Start Your Fitness Journey",
    ),
    IntroductionScreenWidget(
      title: "Explore",
      subTitle: "Motion is lotion",
    ),
    IntroductionScreenWidget(
      title: "Stay Connected",
      subTitle: "Sweat is just fat crying",
    ),
    IntroductionScreenWidget(
      title: "Get Started",
      subTitle: "Lets drive into the app together",
    )
  ];

  final controller = PageController();
  int currentIndex = 0;
  
  Future<void> setValue() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          PageView.builder(
              itemCount: bodyList.length,
              controller: controller,
              itemBuilder: (context, index) => bodyList[index],
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
          ),

          // Positioned(
          //   bottom: 100,
          //     left: 160,
          //     right: 160,
          //     child: SizedBox(
          //       height: 10,
          //       width: 10,
          //       child: ListView.builder(
          //           shrinkWrap: true,
          //           itemCount: bodyList.length,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (context, index) => Container(
          //             height: 10,
          //             width: 10,
          //             margin: EdgeInsets.only(right: 10.0),
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.all(Radius.circular(10.0))
          //             ),
          //           ),
          //       ),
          //     )
          // )
          ///
          // Positioned(
          //     bottom: 200,
          //     left: 80,
          //     right: 80,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         TextButton(
          //             onPressed: (){
          //               controller.jumpToPage(4);
          //             },
          //             child: Text('Skip',
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w700,
          //                 color: Colors.white
          //               ),
          //             )
          //         ),
          //
          //         SmoothPageIndicator(
          //             controller: controller,
          //             count: 4,
          //             onDotClicked: (index) {
          //               controller.jumpToPage(index);
          //             },
          //             effect: ColorTransitionEffect(dotColor: Colors.purple, activeDotColor: Colors.white),
          //         ),
          //
          //         currentIndex == 3? TextButton(
          //             onPressed: (){
          //               // controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
          //             },
          //             child: Text('Done',
          //               style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w700,
          //                   color: Colors.white
          //               ),
          //             )
          //         ):TextButton(
          //             onPressed: (){
          //               controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
          //             },
          //             child: Text('Next',
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w700,
          //                 color: Colors.white
          //               ),
          //             )
          //         ),
          //       ],
          //     )
          // )

          ///

          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                currentIndex == 3 ? TextButton(
                    onPressed: () {},
                    child: Text('',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),
                    )
                ) : TextButton(
                    onPressed: () {
                      controller.jumpToPage(3);
                    },
                    child: Text('Skip',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),
                    )
                ),

                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  onDotClicked: (index) {
                    controller.jumpToPage(index);
                  },
                  effect: ColorTransitionEffect(dotColor: Colors.purple,
                      activeDotColor: Colors.white,
                      activeStrokeWidth: 15),
                ),

                currentIndex == 3 ? TextButton(
                    onPressed: () async{
                      await setValue();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text('Done',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),
                    )
                ) : TextButton(
                    onPressed: () {
                      controller.nextPage(duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Text('Next',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
      
    );
  }
}

