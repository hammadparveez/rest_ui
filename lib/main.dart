import 'package:flutter/material.dart';
import 'package:rest_ui/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:const  TextTheme(
        headline5: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        headline3: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )),
      home: const HomeView(),
    );
  }
}
