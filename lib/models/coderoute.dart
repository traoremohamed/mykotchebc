// To parse this JSON data, do
//
//     final coderoute = coderouteFromJson(jsonString);

import 'dart:convert';

Coderoute coderouteFromJson(String str) => Coderoute.fromJson(json.decode(str));

String coderouteToJson(Coderoute data) => json.encode(data.toJson());

class Coderoute {
  Coderoute({
    this.idCodeRoute,
    this.libelleCodeRoute,
    this.imageCode,
    this.flagCode,
    this.updatedAt,
    this.createdAt,
  });

  String idCodeRoute;
  String libelleCodeRoute;
  String imageCode;
  String flagCode;
  DateTime updatedAt;
  DateTime createdAt;

  factory Coderoute.fromJson(Map<String, dynamic> json) => Coderoute(
    idCodeRoute: json["id_code_route"],
    libelleCodeRoute: json["libelle_code_route"],
    imageCode: json["image_code"],
    flagCode: json["flag_code"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_code_route": idCodeRoute,
    "libelle_code_route": libelleCodeRoute,
    "image_code": imageCode,
    "flag_code": flagCode,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}
