import 'dart:convert';

class ItemModel {
  final String name;
  final double value;
  ItemModel({
    this.name = '',
    this.value = 0,
  });

  ItemModel copyWith({
    String? name,
    double? value,
  }) {
    return ItemModel(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      name: map['name'],
      value: double.tryParse(map['value'].toString()) ?? 0.00,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));

  @override
  String toString() => 'ItemModel(name: $name, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemModel && other.name == name && other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
