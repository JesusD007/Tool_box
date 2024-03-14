// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';

Age genderFromJson(String str) => Age.fromJson(json.decode(str));

String genderToJson(Age data) => json.encode(data.toJson());

class Age {
  final int? count;
  final String? name;
  final int? age;

  Age({
    required this.count,
    required this.name,
    required this.age,
  });

  factory Age.fromJson(Map<String, dynamic> json) => Age(
        count: json["count"],
        name: json["name"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "age": age,
      };
}
