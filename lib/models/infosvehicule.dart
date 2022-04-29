// To parse this JSON data, do
//
//     final infosvehicule = infosvehiculeFromJson(jsonString);

import 'dart:convert';

Infosvehicule infosvehiculeFromJson(String str) => Infosvehicule.fromJson(json.decode(str));

String infosvehiculeToJson(Infosvehicule data) => json.encode(data.toJson());

class Infosvehicule {
  Infosvehicule({
    this.idVehicule,
    this.marqueVehicule,
    this.immatriculation,
    this.idPers,
    this.couleur,
    this.typeVehicule,
    this.flagVehicule,
    this.createdAt,
    this.updatedAt,
  });

  Infosvehicule.empty();
  String idVehicule;
  String marqueVehicule;
  String immatriculation;
  String idPers;
  String couleur;
  String typeVehicule;
  String flagVehicule;
  DateTime createdAt;
  DateTime updatedAt;

  factory Infosvehicule.fromJson(Map<String, dynamic> json) => Infosvehicule(
    idVehicule: json["id_vehicule"],
    marqueVehicule: json["marque_vehicule"],
    immatriculation: json["immatriculation"],
    idPers: json["id_pers"],
    couleur: json["couleur"],
    typeVehicule: json["type_vehicule"],
    flagVehicule: json["flag_vehicule"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_vehicule": idVehicule,
    "marque_vehicule": marqueVehicule,
    "immatriculation": immatriculation,
    "id_pers": idPers,
    "couleur": couleur,
    "type_vehicule": typeVehicule,
    "flag_vehicule": flagVehicule,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
