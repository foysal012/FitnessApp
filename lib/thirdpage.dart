import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/model.dart';
import 'package:fitnessapp/widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThirdPage extends StatefulWidget {
   ThirdPage({Key? key, this.exercise, this.second}) : super(key: key);

   Exercise? exercise;
   int? second;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  int starttime = 0;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(timer.tick == widget.second){
        timer.cancel();

        setState(() {

          showToast("Workout Successfully Done");
          Future.delayed(Duration(seconds: 1), (){
            Navigator.of(context).pop();
          });
        });
      }
      setState(() {
        starttime = timer.tick;
      });
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: "${widget.exercise!.gif}",
              fit: BoxFit.cover,
              placeholder: (context, url) => spinkit,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          Positioned(
              left: 20,
              right: 20,
              top: 20,
              child: Center(
                child: Text("${starttime}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.pink,
                ),
                ),
              ),

          )
        ],
      ),
    );
  }
  showToast(String sms) {
    Fluttertoast.showToast(
        msg: "$sms",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
