import 'package:flutter/material.dart';

import 'package:lazyloadinggridview/gridviewbuilder.dart';

const mycolor = Colors.orange;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppMonsters',
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: gridviewbuilder(),
    );
  }
}
