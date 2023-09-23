import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp_Model {
  String uid;
  String email;
  String fullName;
  String phone_Number;
  String createPassword;
  String confrimPassword;
  String type;

  SignUp_Model(
      {required this.uid,
      required this.email,
      required this.type,
      required this.fullName,
      required this.createPassword,
      required this.confrimPassword,
      required this.phone_Number});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'phone_Number': phone_Number,
        'uid': uid,
        'email': email,
        'type': type,
        'fullName': fullName,
        'confrimPassword': confrimPassword,
        'createPassword': createPassword
      };

  ///
  static SignUp_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return SignUp_Model(
      phone_Number: snapshot['phone_Number'],
      uid: snapshot['uid'],
      type: snapshot['type'],
      email: snapshot['email'],
      createPassword: snapshot['createPassword'],
      fullName: snapshot['fullName'],
      confrimPassword: snapshot['confrimPassword'],
    );
  }
}
