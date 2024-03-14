import 'dart:convert';

List<Universities> universitiesFromJson(String str) => List<Universities>.from(
    json.decode(str).map((x) => Universities.fromJson(x)));

class Universities {
  final List<String>? webPages;
  final String name;
  final List<String> domains;

  Universities({
    required this.webPages,
    required this.name,
    required this.domains,
  });

  factory Universities.fromJson(Map<String, dynamic> json) => Universities(
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
        domains: List<String>.from(json["domains"].map((x) => x)),
      );
}
