import 'dart:convert';

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

  var data;

  final String url =
      "https://api.giphy.com/v1/gifs/search?api_key=imv0MqAoW8tJ2RijqNF94vK5D4xk8mz2&limit=25&offset=0&rating=G&lang=en&q=";
  void fetchData(String searchInput) async {
    Uri uri = Uri.parse(url + searchInput);

    http.Response res = await http.get(uri);
    data = jsonDecode(res.body)["data"];
    setState(() {});

    print(data);
  }

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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
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
                          onPressed: () {
                            fetchData(controller.text);
                          },
                          child: Text('GO!'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VxConditional(
                    condition: data != null,
                    builder: (context) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.isMobile ? 2 : 3),
                      itemBuilder: (context, index) {
                        final url =
                            data[index]["images"]["fixed_height"]["url"];
                        return Text(url);
                      },
                      itemCount: data.length,
                    ),
                    fallback: (context) => const Text(
                      'Nothing Found',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ).h(context.percentHeight * 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
