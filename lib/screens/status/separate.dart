import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedValue;
  late Future<Map<String, dynamic>> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = fetchJsonData();
  }

  Future<Map<String, dynamic>> fetchJsonData() async {
    final DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance.doc('city').get();

    final jsonDataString = document.data()?['jsonData'] ?? '{}';
    return json.decode(jsonDataString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore JSON Dropdown Example'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: jsonData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Loading indicator while fetching data.
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final jsonData = snapshot.data;

              // Build the DropdownButton using the JSON data.
              return DropdownButton<String>(
                value: selectedValue, // Set the selected value (if any).
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                items: jsonData?.keys.map<DropdownMenuItem<String>>((key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(jsonData[key].toString()),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
