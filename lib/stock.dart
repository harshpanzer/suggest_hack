import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:suggest/user_data.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[0],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[1],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[2],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[3],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[4],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[5],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[6],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            stocks()[7],
            style:
                TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
          ),
        )
      ],
    ));
  }

  friend_list() async {
    final value =
        await FirebaseFirestore.instance.collection("Users").doc('stock').get();

    var friendsList = value.data()!["stocks"];
    print(friend_list());
    return friendsList;
  }
}
