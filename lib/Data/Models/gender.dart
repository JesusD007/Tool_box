import 'dart:convert';

Gender genderFromJson(String str) => Gender.fromJson(json.decode(str));

String genderToJson(Gender data) => json.encode(data.toJson());

class Gender {
  final int? count;
  final String? name;
  final String? gender;
  final double? probability;

  Gender({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        count: json["count"],
        name: json["name"],
        gender: json["gender"],
        probability: json["probability"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "gender": gender,
        "probability": probability,
      };
}
