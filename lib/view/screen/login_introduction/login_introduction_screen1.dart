import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'login_introduction_screen2.dart';

class LoginIntroductionScreen1 extends StatefulWidget {
  const LoginIntroductionScreen1({super.key});

  @override
  State<LoginIntroductionScreen1> createState() => _LoginIntroductionScreen1State();
}

class _LoginIntroductionScreen1State extends State<LoginIntroductionScreen1> {

  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      ChartData('CHN', 3),
      ChartData('GER', 6),
      ChartData('RUS', 9),
      ChartData('BRZ', 4.4),
      ChartData('IND', 8)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
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

                Container(
                  height: 180,
                  width: 200,
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
                      child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 2),
                          tooltipBehavior: _tooltip,
                          series: <CartesianSeries<ChartData, String>>[
                            ColumnSeries<ChartData, String>(
                                dataSource: data,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                name: 'Gold',
                                color: Color.fromRGBO(8, 142, 255, 1))
                          ]
                      ),
                    )

                    ],
                  ),
                ),
                Gap(70.0),

                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIntroductionScreen2())),
                  child: Container(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                            child: Icon(Icons.arrow_forward_ios),
                          ),

                          Text('Lets start',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              )
                          ),

                          Row(
                            children: [
                              Icon(Icons.arrow_forward_ios, color: Colors.white30),
                              Gap(5.0),
                              Icon(Icons.arrow_forward_ios, color: Colors.white54),
                              Gap(5.0),
                              Icon(Icons.arrow_forward_ios, color: Colors.white),
                            ],
                          )
                        ],
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

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}