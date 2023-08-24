import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class GiphyPage extends StatefulWidget {
  const GiphyPage({super.key});

  @override
  State<GiphyPage> createState() => _GiphyPageState();
}

class _GiphyPageState extends State<GiphyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray800,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'giphy-world',
          style: TextStyle(
            fontSize: 36,
            fontFamily: 'CircularStdFont',
          ),
        ),
      ),
      body: Theme(
        data: ThemeData.dark(),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
