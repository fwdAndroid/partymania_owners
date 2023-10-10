import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/services/storage_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';

import '../../../../utils/image.dart';

class EventPhotoUpdate extends StatefulWidget {
  final String image;
  final uuid;
  EventPhotoUpdate({super.key, required this.image, required this.uuid});

  @override
  State<EventPhotoUpdate> createState() => _EventPhotoUpdateState();
}

class _EventPhotoUpdateState extends State<EventPhotoUpdate> {
  bool _isLoading = false;
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: backgroundColor,
          title: Text(
            "Update Cover Photo",
            style: TextStyle(color: textColor),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? Image.memory(
                            width: 335, height: 160, fit: BoxFit.fill, _image!)
                        : CircleAvatar(
                            radius: 59,
                            backgroundImage: NetworkImage(widget.image),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 70,
                        child: IconButton(
                            onPressed: () => selectImage(),
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            )))
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SaveButton(onTap: updateImage, title: "Image Update"))
            ]));
  }

  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  void updateImage() async {
    print(widget.uuid);
    setState(() {
      _isLoading = true;
    });
    String photoURL = await StorageMethods()
        .uploadImageToStorage('ProfilePics', _image!, false);
    FirebaseFirestore.instance
        .collection("events")
        .doc(widget.uuid)
        .update({"eventPhoto": photoURL});

    setState(() {
      _isLoading = true;
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => MainScreen()));
  }
}
