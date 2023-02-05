import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 84, 200),
      appBar: AppBar(
        title: Text('Suggest'),
        backgroundColor: Color.fromARGB(255, 78, 84, 200),
      ),
    );
  }
}
