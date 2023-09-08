import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complaints Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ComplaintForm(),
    );
  }
}

class ComplaintForm extends StatefulWidget {
  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  bool _isSubmitted = false;

  void _submitForm() {
    setState(() {
      _isSubmitted = true;
    });
  }

  void _resetForm() {
    setState(() {
      _isSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complains Form'),
      ),
      body: Center(
        child: _isSubmitted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/downloard.png', // Replace with your image asset path
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    ' Successfully Submitted!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _resetForm,
                    child: Text('Submit Again'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
      ),
    );
  }
}