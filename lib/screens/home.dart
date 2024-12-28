import 'package:flutter/material.dart';

class Homme_Screen extends StatefulWidget {
  const Homme_Screen({super.key});

  @override
  State<Homme_Screen> createState() => _Homme_ScreenState();
}

class _Homme_ScreenState extends State<Homme_Screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Home Page"),
      ),
    );
  }
}