import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class GiphyPage extends StatefulWidget {
  @override
  State<GiphyPage> createState() => _GiphyPageState();
}

class _GiphyPageState extends State<GiphyPage> {
  final TextEditingController controller = TextEditingController();
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFF3A46)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            label: Text('Search Giphy'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black87),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(50, 50))),
                          onPressed: () {},
                          child: Text('GO!'),
                        ),
                      )
                    ],
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
