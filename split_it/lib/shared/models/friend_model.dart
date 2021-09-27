import 'dart:convert';

class FriendModel {
  final String name;
  final String photoURL;
  final bool isPaid;
  FriendModel(
      {required this.name, required this.photoURL, this.isPaid = false});

  FriendModel copyWith({String? name, String? photoURL, bool? isPaid}) {
    return FriendModel(
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'photoURL': photoURL, 'isPaid': isPaid};
  }

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      name: map['name'],
      isPaid: map['isPaid'] ?? false,
      photoURL: map['photoURL'] ??
          'https://cdn.icon-icons.com/icons2/1993/PNG/512/avatar_male_man_people_person_profile_user_icon_123199.png',
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendModel.fromJson(String source) =>
      FriendModel.fromMap(json.decode(source));

  @override
  String toString() => 'FriendModel(name: $name, photoURL: $photoURL)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FriendModel &&
        other.name == name &&
        other.photoURL == photoURL;
  }

  @override
  int get hashCode => name.hashCode ^ photoURL.hashCode;
}
