import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slider_button/slider_button.dart';
import 'login_introduction_screen2.dart';

class LoginIntroductionScreen1 extends StatefulWidget {
  const LoginIntroductionScreen1({super.key});

  @override
  State<LoginIntroductionScreen1> createState() => _LoginIntroductionScreen1State();
}

class _LoginIntroductionScreen1State extends State<LoginIntroductionScreen1> {
  Future<void> goNext(BuildContext context) async{
    try {
      debugPrint("Start");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginIntroductionScreen2(),
          ),
        );
      });
      debugPrint("End");
    } catch (e) {
      debugPrint("Error is ${e.toString()}");
    }
  }

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

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIntroductionScreen2()));
                  },
                  child: SliderButton(
                    // action: () async => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIntroductionScreen2())),
                    action: () async {
                     return false;
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
                ),

              ],
            ),
          ),
        )
    );
  }
}

class SlideToNextPage extends StatefulWidget {
  @override
  _SlideToNextPageState createState() => _SlideToNextPageState();
}

class _SlideToNextPageState extends State<SlideToNextPage> {
  double _value = 0.0;

  void _handleComplete() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LoginIntroductionScreen2(),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Slider Button")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            _value >= 90 ? "Release to Continue" : "Slide to Continue",
            style: TextStyle(fontSize: 18),
          ),

          SizedBox(height: 30),

          Slider(
            value: _value,
            min: 0,
            max: 100,
            divisions: 100,

            onChanged: (newValue) {
              setState(() {
                _value = newValue;
              });
            },

            onChangeEnd: (newValue) {
              if (newValue >= 95) {
                _handleComplete(); // ✅ navigate
              } else {
                // 🔄 reset if not completed
                setState(() {
                  _value = 0;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
