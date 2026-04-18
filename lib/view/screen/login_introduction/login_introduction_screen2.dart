import 'package:flutter/material.dart';
import 'package:flutter_unit_ruler/scale_controller.dart';
import 'package:flutter_unit_ruler/scale_line.dart';
import 'package:flutter_unit_ruler/scale_unit.dart';
import 'package:flutter_unit_ruler/unit_ruler.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginIntroductionScreen2 extends StatefulWidget {
  LoginIntroductionScreen2({super.key});

  @override
  State<LoginIntroductionScreen2> createState() =>
      _LoginIntroductionScreen2State();
}

class _LoginIntroductionScreen2State extends State<LoginIntroductionScreen2> {
  final controller = PageController();

  final darkThemeColor = const Color(
    0xFF0b1f28,
  ); // Background color for the ruler
  late final ScaleController
  _scaleController; // Controller to manage the current value

  double currentHeight = 180.0;

  @override
  void initState() {
    _scaleController = ScaleController(value: currentHeight);
    super.initState();
  }

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
              image: DecorationImage(
                image: AssetImage('assets/image/intro_screen.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(50.0),

                  Text(
                    'Start your\nfitness Journey!',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Gap(10.0),

                  Text(
                    'Start your fitness journey\nwith our app\'s guidance and support',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Gap(400.0),
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
              effect: ColorTransitionEffect(
                dotColor: Colors.purple,
                activeDotColor: Colors.white,
                activeStrokeWidth: 15,
              ),
            ),
          ),

          Positioned(
            bottom: 400,
            left: 120,
            right: 120,
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: UnitRuler(
                        height: 300,
                        // Height of the ruler
                        width: MediaQuery.of(context).size.width,
                        // Width of the ruler
                        controller: _scaleController,
                        // Use scale controller for dynamic updates
                        scrollDirection: Axis.vertical,
                        // Set ruler orientation to vertical
                        backgroundColor: darkThemeColor,
                        // Background color
                        scaleUnit: UnitType.length.centimeter,
                        // Set unit to centimeters
                        scaleAlignment: Alignment.topRight,
                        // Align scale to the top-right
                        scalePadding: const EdgeInsets.only(
                          left: 0,
                          right: 40,
                          top: 10,
                        ),
                        // Padding for the scale
                        scaleMargin: 120,
                        // Margin for scale placement
                        scaleMarker: Container(
                          height: 2,
                          width: 240,
                          color: const Color(
                            0xFF3EB48C,
                          ), // Color of scale marker
                        ),
                        scaleMarkerPositionTop: 10,
                        // Top position of the scale marker
                        scaleMarkerPositionLeft: 20,
                        // Left position of the scale marker
                        scaleIntervalText: (index, value) =>
                            value.toInt().toString(),
                        // Format interval text
                        scaleIntervalTextStyle: const TextStyle(
                          color: Color(0xFFBCC2CB),
                          fontSize: 14,
                        ),
                        scaleIntervalTextPosition: 80,
                        // Text position on the scale
                        scaleIntervalStyles: const [
                          ScaleIntervalStyle(
                            color: Colors.yellow,
                            width: 35,
                            height: 2,
                            scale: -1,
                          ),
                          ScaleIntervalStyle(
                            color: Colors.blue,
                            width: 50,
                            height: 2.5,
                            scale: 0,
                          ),
                          ScaleIntervalStyle(
                            color: Colors.redAccent,
                            width: 40,
                            height: 2,
                            scale: 5,
                          ),
                        ],
                        onValueChanged: (value) => setState(
                          () => currentHeight = value.toDouble(),
                        ), // Update height value
                      ),
                    ),
                    Positioned(
                      bottom: 220,
                      left: 110,
                      child: Text(
                        "${currentHeight.toInt()} ${UnitType.length.centimeter.symbol}",
                        // Display current height in centimeters
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
