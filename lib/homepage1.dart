import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suggest/function.dart';
import 'package:suggest/stocklist.dart';

class Homepageot extends StatefulWidget {
  const Homepageot({super.key});

  @override
  State<Homepageot> createState() => _HomepageotState();
}

class _HomepageotState extends State<Homepageot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 84, 200),
      appBar: AppBar(
        title: Text('Suggest'),
        backgroundColor: Color.fromARGB(255, 78, 84, 200),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => StockList())));
              },
              child: Container(
                padding: EdgeInsets.only(left: 50),
                height: 200,
                width: 300,
                child: Image.asset(
                  'assets/images/stock.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Suggest',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
