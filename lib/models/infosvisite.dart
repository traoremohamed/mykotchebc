// To parse this JSON data, do
//
//     final infosvisite = infosvisiteFromJson(jsonString);

import 'dart:convert';

Infosvisite infosvisiteFromJson(String str) => Infosvisite.fromJson(json.decode(str));

String infosvisiteToJson(Infosvisite data) => json.encode(data.toJson());

class Infosvisite {
  Infosvisite({
    this.idVehicule,
    this.marqueVehicule,
    this.immatriculation,
    this.idPers,
    this.couleur,
    this.typeVehicule,
    this.flagVehicule,
    this.createdAt,
    this.updatedAt,
    this.idVisite,
    this.dateDernierVisite,
    this.dateVisiteProchain,
    this.dateRappelVisiteProchain,
    this.idVehiculee,
    this.idPersonne,
    this.lieuVisite,
    this.flagVisite,
  });

  String idVehicule;
  String marqueVehicule;
  String immatriculation;
  String idPers;
  String couleur;
  String typeVehicule;
  String flagVehicule;
  DateTime createdAt;
  DateTime updatedAt;
  String idVisite;
  DateTime dateDernierVisite;
  DateTime dateVisiteProchain;
  DateTime dateRappelVisiteProchain;
  String idVehiculee;
  String idPersonne;
  dynamic lieuVisite;
  String flagVisite;

  factory Infosvisite.fromJson(Map<String, dynamic> json) => Infosvisite(
    idVehicule: json["id_vehicule"],
    marqueVehicule: json["marque_vehicule"],
    immatriculation: json["immatriculation"],
    idPers: json["id_pers"],
    couleur: json["couleur"],
    typeVehicule: json["type_vehicule"],
    flagVehicule: json["flag_vehicule"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idVisite: json["id_visite"],
    dateDernierVisite: DateTime.parse(json["date_dernier_visite"]),
    dateVisiteProchain: DateTime.parse(json["date_visite_prochain"]),
    dateRappelVisiteProchain: DateTime.parse(json["date_rappel_visite_prochain"]),
    idVehiculee: json["id_vehiculee"],
    idPersonne: json["id_personne"],
    lieuVisite: json["lieu_visite"],
    flagVisite: json["flag_visite"],
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
    "id_visite": idVisite,
    "date_dernier_visite": "${dateDernierVisite.year.toString().padLeft(4, '0')}-${dateDernierVisite.month.toString().padLeft(2, '0')}-${dateDernierVisite.day.toString().padLeft(2, '0')}",
    "date_visite_prochain": "${dateVisiteProchain.year.toString().padLeft(4, '0')}-${dateVisiteProchain.month.toString().padLeft(2, '0')}-${dateVisiteProchain.day.toString().padLeft(2, '0')}",
    "date_rappel_visite_prochain": "${dateRappelVisiteProchain.year.toString().padLeft(4, '0')}-${dateRappelVisiteProchain.month.toString().padLeft(2, '0')}-${dateRappelVisiteProchain.day.toString().padLeft(2, '0')}",
    "id_vehiculee": idVehiculee,
    "id_personne": idPersonne,
    "lieu_visite": lieuVisite,
    "flag_visite": flagVisite,
  };
}
