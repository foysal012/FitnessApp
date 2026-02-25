import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/model.dart';
import 'package:fitnessapp/thirdpage.dart';
import 'package:fitnessapp/widget.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SecondPage extends StatefulWidget {
   SecondPage({Key? key, this.exercise}) : super(key: key);

  Exercise? exercise;


  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThirdPage(
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
