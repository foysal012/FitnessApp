import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/model.dart';
import 'package:fitnessapp/secondpage.dart';
import 'package:fitnessapp/widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var link =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR2gsu4SRvRRFKHK8JPTWHZXmaNP0dtpOG6H7ep4zQp7WaamX5S1UaSrc";

  late Exercise? exercise;
  List<Exercise> allData = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse(link));
      print("Our response code is : ${response.statusCode}");
      print("Our response body is : ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var i in data["exercises"]) {
          exercise = Exercise(
            id: i["id"],
            title: i["title"],
            thumbnail: i["thumbnail"],
            gif: i["gif"],
            seconds: i["seconds"],
          );

          setState(() {
            allData.add(exercise!);
          });
          setState(() {
            isLoading = false;
          });
        }

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      print("The problem is ${e}");
      showToast("Something went wrong bro...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 0.5,
      opacity: 0.5,
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: allData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage(
                      exercise: allData[index],
                    )));
                  },
                  child: Container(
                    height: 280,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CachedNetworkImage(
                            imageUrl: "${allData[index].thumbnail}",
                            placeholder: (context, url) => spinkit,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),

                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(

                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black12,
                                    Colors.black54,
                                    Colors.black87,
                                    Colors.black,
                                  ]
                                )
                              ),
                                child: Center(
                                  child: Text("${allData[index].title}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                  ),
                                ),
                            ),
                        )
                      ],
                    ),
                  ),
                );
              })),
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
