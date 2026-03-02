import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../resources/app_image/app_image.dart';

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
          Positioned(
              bottom: 200,
              left: 160,
              right: 160,
              child: GestureDetector(
                onTap: () => controller.jumpToPage(currentIndex),
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 4
                ),
              )
          )
        ],
      ),
      
    );
  }
}


class IntroductionScreenWidget extends StatelessWidget {
  const IntroductionScreenWidget({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;


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

            Positioned(
                right: 100.0,
                left: 100.0,
                bottom: 300.0,
                child: Column(
                  children: [
                    Text('${title}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Gap(10.0),

                    Text('${subTitle}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}

