import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../view_model/home_screen/home_screen_provider.dart';
import '../../widget/widget.dart';
import '../second_screen/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final homeProvider = Provider.of<HomeScreenProvider>(context, listen: false);

  @override
  void initState() {
    super.initState();
    homeProvider.fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, value, child) {
      return ModalProgressHUD(
        blur: 0.5,
        opacity: 0.5,
        inAsyncCall: value.isLoading,
        progressIndicator: CircularProgressIndicator(),
        child: Scaffold(
            body: RefreshIndicator(
              onRefresh: ()=> value.onRefresh(),
              child: ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  itemCount: value.allData.length,
                  itemBuilder: (context, index) {
                    final dataInfo = value.allData[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>SecondScreen(
                                  exercise: dataInfo
                                )
                            )),
                      child: Container(
                        height: 280,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                width: MediaQuery.sizeOf(context).width,
                                imageUrl: "${dataInfo.thumbnail}",
                                fit: BoxFit.fill,
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
                                  child: Text("${dataInfo.title}",
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
                  }),
            )
        ),
      );
    },);
  }
}
