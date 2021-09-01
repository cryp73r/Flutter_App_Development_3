import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MandiScreen extends StatefulWidget {
  const MandiScreen({Key? key}) : super(key: key);

  @override
  _MandiScreenState createState() => _MandiScreenState();
}

class _MandiScreenState extends State<MandiScreen> {
  Map rawData = {"1":""};

  void fetchDataWrite() async {
    String url = "https://thekrishi.com/test/mandi?lat=28.44108136&lon=77.0526054&ver=89&lang=hi&crop_id=10";
    http.Response response = await http.get(Uri.parse(url));

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File("$path/data.txt");
    file.writeAsString(utf8.decode(response.bodyBytes).toString());
    setState(() {
      rawData = json.decode(utf8.decode(response.bodyBytes));
    });
  }

  readData() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File("$path/data.txt");
    try {
      rawData = json.decode(utf8.decode(await file.readAsBytes()));
    } catch (e) {
      debugPrint("$e");
    }
    setState(() {});
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(onPressed: fetchDataWrite, child: const Text("Fetch")),
          if (rawData["1"]!="") Flexible(
            child: ListView.builder(itemCount: rawData["data"]["other_mandi"].length, itemBuilder: (_, int index) {
              return Card(
                child: Column(
                  children: [
                    Text("${rawData["data"]["other_mandi"][index]["crop_id"]}"),
                    Text(rawData["data"]["other_mandi"][index]["district"]),
                    Text("${rawData["data"]["other_mandi"][index]["district_id"]}"),
                    Text(rawData["data"]["other_mandi"][index]["hindi_name"]),
                    Text("${rawData["data"]["other_mandi"][index]["id"]}"),
                    Text(rawData["data"]["other_mandi"][index]["image"]),
                    Text("${rawData["data"]["other_mandi"][index]["km"]}"),
                    Text(rawData["data"]["other_mandi"][index]["last_date"]),
                    Text("${rawData["data"]["other_mandi"][index]["lat"]}"),
                    Text("${rawData["data"]["other_mandi"][index]["lng"]}"),
                    Text(rawData["data"]["other_mandi"][index]["location"]),
                    Text(rawData["data"]["other_mandi"][index]["market"]),
                    Text("${rawData["data"]["other_mandi"][index]["meters"]}"),
                    Text(rawData["data"]["other_mandi"][index]["state"]),
                    Text("${rawData["data"]["other_mandi"][index]["url_str"]}"),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
