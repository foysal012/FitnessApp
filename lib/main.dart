import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/screen/Home/home_screen/home_screen.dart';
import 'view/screen/splash/splash_screen1.dart';
import 'view/screen/splash/splash_screen2.dart';
import 'view_model/home_screen/home_screen_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeScreenProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          // home: HomeScreen(),
          home: SplashScreen1(),
        ),
    );
  }
}