import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/services/storage_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/image.dart';

class ImageCoverUpdate extends StatefulWidget {
  final String image;
  const ImageCoverUpdate({super.key, required this.image});

  @override
  State<ImageCoverUpdate> createState() => _ImageCoverUpdateState();
}

class _ImageCoverUpdateState extends State<ImageCoverUpdate> {
  Uint8List? _image;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: backgroundColor,
          title: Text(
            "Update Event Cover Photo",
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
    setState(() {
      _isLoading = true;
    });
    String photoURL = await StorageMethods()
        .uploadImageToStorage('ProfilePics', _image!, false);
    FirebaseFirestore.instance
        .collection("clubs")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"coverPhoto": photoURL});

    setState(() {
      _isLoading = true;
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => MainScreen(
                  user: FirebaseAuth.instance.currentUser,
                )));
  }
}
