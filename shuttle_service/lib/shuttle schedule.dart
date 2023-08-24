import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key?  key}):super(key:Key);

  @override
  _HomePageState createState=> _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentwidth= MediaQuery.of(context).size.width;
    return Scaffold{
  Body:Center{
      child:Text(currentwidth.toString()),

    }
  }
}