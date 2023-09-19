import 'dart:convert';
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
  bool showLoading = false;
  final String url =
      // your api ...

  void fetchData(String searchInput) async {
    showLoading = true;
    Uri uri = Uri.parse(url + searchInput);

    http.Response res = await http.get(uri);
    data = jsonDecode(res.body)["data"];
    setState(() {
      showLoading = false;
    });

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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            controller: controller,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFFF3A46)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              label: Text(
                                'Search Giphy',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black87),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(50, 50))),
                            onPressed: () {
                              fetchData(controller.text);
                            },
                            child: const Text(
                              'GO!',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (showLoading)
                      CircularProgressIndicator().centered()
                    else
                      VxConditional(
                        condition: data != null,
                        builder: (context) => GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: context.isMobile ? 2 : 3),
                          itemBuilder: (context, index) {
                            final url =
                                data[index]["images"]["fixed_height"]["url"];
                            return Image.network(
                              url,
                              fit: BoxFit.cover,
                            ).card.roundedSM.make();
                          },
                          itemCount: data.length,
                        ),
                        fallback: (context) => const Text(
                          '',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.grey,
                          ),
                        ),
                      ).h(context.percentHeight * 70),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
