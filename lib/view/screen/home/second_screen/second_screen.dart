import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../../../model/excercise_model.dart';
import '../../../widget/widget.dart';
import '../third_screen/third_screen.dart';


class SecondScreen extends StatefulWidget {
   SecondScreen({Key? key, this.exercise}) : super(key: key);

  final Exercise? exercise;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  double seconds = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: "${widget.exercise!.thumbnail}",
              fit: BoxFit.cover,
              height: double.infinity,
              placeholder: (context, url) => spinkit,
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
            ),
          ),

          Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: SleekCircularSlider(
                min: 3,
                max: 10,
                initialValue: seconds,
                onChange: (double value) {
                  setState(() {
                    seconds = value;
                  });
                },

                innerWidget: (double value) {
                 return Padding(
                   padding: EdgeInsets.only(
                     bottom: 20
                   ),
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                   Text("${seconds.toStringAsFixed(0)}",
                   style: TextStyle(
                     color: Colors.pink,
                     fontWeight: FontWeight.bold,
                     fontSize: 30,
                     fontStyle: FontStyle.italic,
                   ),
                   ),

                   ElevatedButton(
                     onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThirdScreen(
                      exercise: widget.exercise,
                      second: seconds.toInt(),
                    )));
                   },
                   child: Text("Select"),
                     style: ElevatedButton.styleFrom(
                      // primary: Colors.deepPurple,
                     ),
                   )
                 ],));
                },
              ))
        ],
      ),

    );
  }
}
