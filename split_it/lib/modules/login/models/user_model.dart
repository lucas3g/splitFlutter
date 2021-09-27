import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/shared/models/base_model.dart';

class UserModel extends BaseModel {
  final String? name;
  final String email;
  final String id;
  final String? photoURL;

  UserModel({
    this.name,
    required this.email,
    required this.id,
    this.photoURL,
  }) : super(collection: '/users');

  factory UserModel.google(GoogleSignInAccount account) {
    return UserModel(
        name: account.displayName,
        email: account.email,
        id: account.id,
        photoURL: account.photoUrl);
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? id,
    String? photoURL,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'photoURL': photoURL,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      id: map['id'],
      photoURL: map['photoURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, id: $id, photoURL: $photoURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.id == id &&
        other.photoURL == photoURL;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ id.hashCode ^ photoURL.hashCode;
  }
}
