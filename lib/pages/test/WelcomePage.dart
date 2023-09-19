import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  final String textValue;

  StatefulPage({required this.textValue});

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Page'),
      ),
      body: Center(
        child: Text('Received text: ${widget.textValue}'),
      ),
    );
  }
}
