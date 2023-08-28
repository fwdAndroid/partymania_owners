import 'package:cloud_firestore/cloud_firestore.dart';

class HandlerModel {
  String uid;
  String currentUid;
  String email;
  String fullName;
  String phone_Number;
  String createPassword;
  String type;
  String confrimPassword;

  HandlerModel(
      {required this.uid,
      required this.email,
      required this.fullName,
      required this.currentUid,
      required this.type,
      required this.createPassword,
      required this.confrimPassword,
      required this.phone_Number});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'phone_Number': phone_Number,
        'uid': uid,
        "currentUid": currentUid,
        "type": type,
        'email': email,
        'fullName': fullName,
        'confrimPassword': confrimPassword,
        'createPassword': createPassword
      };

  ///
  static HandlerModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return HandlerModel(
      phone_Number: snapshot['phone_Number'],
      uid: snapshot['uid'],
      type: snapshot['type'],
      email: snapshot['email'],
      createPassword: snapshot['createPassword'],
      fullName: snapshot['fullName'],
      currentUid: snapshot['currentUid'],
      confrimPassword: snapshot['confrimPassword'],
    );
  }
}
