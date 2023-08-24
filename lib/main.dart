import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'giphy_demo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // The root Widget of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GiphyPage(),
    );
  }
}
