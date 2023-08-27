import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  List<TextEditingController> _controllers = [];
  List<String> _values = [];

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addFormField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _saveValues() {
    setState(() {
      _values = _controllers.map((controller) => controller.text).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Multi-Value Form'),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            child: Expanded(
              child: ListView.builder(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controllers[index],
                      decoration:
                          InputDecoration(labelText: 'Value ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addFormField,
            child: Text('Add Field'),
          ),
          ElevatedButton(
            onPressed: _saveValues,
            child: Text('Save Values'),
          ),
          SizedBox(height: 20),
          Text('Entered Values:'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _values.map((value) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
