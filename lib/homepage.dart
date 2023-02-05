import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suggest/function.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 84, 200),
      appBar: AppBar(
        title: Text('Suggest'),
        backgroundColor: Color.fromARGB(255, 78, 84, 200),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            onChanged: (value) {
              url = 'http://127.0.0.1:5000/api?query=' + value.toString();
            },
          ),
          TextButton(
              onPressed: () async {
                data = await fetchdata(url);
                var decoded = jsonDecode(data);
                setState(() {
                  output = decoded['output'];
                });
              },
              child: Text(
                'Fetch ASCII Value',
                style: TextStyle(fontSize: 20),
              )),
          Text(
            output,
            style: TextStyle(fontSize: 40, color: Colors.green),
          )
        ]),
      ),
    );
  }
}
