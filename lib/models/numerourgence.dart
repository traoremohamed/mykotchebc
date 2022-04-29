// To parse this JSON data, do
//
//     final numerourgence = numerourgenceFromJson(jsonString);

import 'dart:convert';

Numerourgence numerourgenceFromJson(String str) => Numerourgence.fromJson(json.decode(str));

String numerourgenceToJson(Numerourgence data) => json.encode(data.toJson());

class Numerourgence {
  Numerourgence({
    this.idNumUrg,
    this.libelleNumUrg,
    this.valeurNumUrg,
    this.flagNumUrg,
    this.createdAt,
    this.updatedAt,
  });

  String idNumUrg;
  String libelleNumUrg;
  String valeurNumUrg;
  String flagNumUrg;
  DateTime createdAt;
  DateTime updatedAt;

  factory Numerourgence.fromJson(Map<String, dynamic> json) => Numerourgence(
    idNumUrg: json["id_num_urg"],
    libelleNumUrg: json["libelle_num_urg"],
    valeurNumUrg: json["valeur_num_urg"],
    flagNumUrg: json["flag_num_urg"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_num_urg": idNumUrg,
    "libelle_num_urg": libelleNumUrg,
    "valeur_num_urg": valeurNumUrg,
    "flag_num_urg": flagNumUrg,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
