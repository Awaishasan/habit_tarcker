import 'dart:convert';

class UserModel {
  final String uid;
  final String email;
  final String userName;


  UserModel({
    required this.uid,
    required this.email,
    required this.userName,
  });

  // Convert a UserModel into a Map (for Firestore / JSON)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
    };
  }

  // Create a UserModel from a Map (from Firestore / JSON)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      userName: map['userName']?? '',
    );
  }
  String toJson() => json.encode(toMap());

}
