import 'package:flutter/material.dart';
import 'package:untitled1/pages/test/WelcomePage.dart';

class StatelessWidgetWithTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget with TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textFieldController,
              decoration: InputDecoration(labelText: 'Enter some text'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String textValue = textFieldController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatefulPage(textValue: textValue),
                  ),
                );
              },
              child: Text('Go to Stateful Page'),
            ),
          ],
        ),
      ),
    );
  }
}
