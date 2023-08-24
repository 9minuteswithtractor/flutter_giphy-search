import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF3A46),
          centerTitle: true,
          // leading: const CircleAvatar(
          //   backgroundImage: AssetImage('assets/images/giphy_logo.png'),
          // ),
          title: const Text(
            'searchable-giphy',
            style: TextStyle(
              fontFamily: 'CircularStdFont',
              fontSize: 40,
            ),
          ),
        ),
      ),
    ),
  );
}
