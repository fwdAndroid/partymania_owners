import 'package:flutter/material.dart';

class NewAPp extends StatefulWidget {
  @override
  _NewAPpState createState() => _NewAPpState();
}

class _NewAPpState extends State<NewAPp> {
  List<String> values = []; // List to store values

  TextEditingController textEditingController = TextEditingController();

  void addValue(String newValue) {
    setState(() {
      values.add(newValue); // Add the new value to the list
      textEditingController.clear(); // Clear the input field
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Value Storage'),
        ),
        body: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(labelText: 'Enter a value'),
              onSubmitted: (value) {
                addValue(value); // Call addValue when the user submits a value
              },
            ),
            SizedBox(height: 20),
            Text('Stored Values:'),
            Expanded(
              child: ListView.builder(
                itemCount: values.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(values[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
