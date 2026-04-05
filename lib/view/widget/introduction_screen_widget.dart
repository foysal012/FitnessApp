import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/app_image/app_image.dart';

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