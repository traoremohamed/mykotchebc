// To parse this JSON data, do
//
//     final infosassurance = infosassuranceFromJson(jsonString);

import 'dart:convert';

Infosassurance infosassuranceFromJson(String str) => Infosassurance.fromJson(json.decode(str));

String infosassuranceToJson(Infosassurance data) => json.encode(data.toJson());

class Infosassurance {
  Infosassurance({
    this.idVehicule,
    this.marqueVehicule,
    this.immatriculation,
    this.idPers,
    this.couleur,
    this.typeVehicule,
    this.flagVehicule,
    this.createdAt,
    this.updatedAt,
    this.idAssurance,
    this.idPersonne,
    this.libelleAssurance,
    this.dateExpirationAssurance,
    this.dateRappelAssurance,
    this.dateRappelRappelAssurance,
    this.flagRappelAssurance,
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
  String idAssurance;
  String idPersonne;
  String libelleAssurance;
  DateTime dateExpirationAssurance;
  DateTime dateRappelAssurance;
  DateTime dateRappelRappelAssurance;
  String flagRappelAssurance;

  factory Infosassurance.fromJson(Map<String, dynamic> json) => Infosassurance(
    idVehicule: json["id_vehicule"],
    marqueVehicule: json["marque_vehicule"],
    immatriculation: json["immatriculation"],
    idPers: json["id_pers"],
    couleur: json["couleur"],
    typeVehicule: json["type_vehicule"],
    flagVehicule: json["flag_vehicule"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idAssurance: json["id_assurance"],
    idPersonne: json["id_personne"],
    libelleAssurance: json["libelle_assurance"],
    dateExpirationAssurance: DateTime.parse(json["date_expiration_assurance"]),
    dateRappelAssurance: DateTime.parse(json["date_rappel_assurance"]),
    dateRappelRappelAssurance: DateTime.parse(json["date_rappel_rappel_assurance"]),
    flagRappelAssurance: json["flag_rappel_assurance"],
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
    "id_assurance": idAssurance,
    "id_personne": idPersonne,
    "libelle_assurance": libelleAssurance,
    "date_expiration_assurance": "${dateExpirationAssurance.year.toString().padLeft(4, '0')}-${dateExpirationAssurance.month.toString().padLeft(2, '0')}-${dateExpirationAssurance.day.toString().padLeft(2, '0')}",
    "date_rappel_assurance": "${dateRappelAssurance.year.toString().padLeft(4, '0')}-${dateRappelAssurance.month.toString().padLeft(2, '0')}-${dateRappelAssurance.day.toString().padLeft(2, '0')}",
    "date_rappel_rappel_assurance": "${dateRappelRappelAssurance.year.toString().padLeft(4, '0')}-${dateRappelRappelAssurance.month.toString().padLeft(2, '0')}-${dateRappelRappelAssurance.day.toString().padLeft(2, '0')}",
    "flag_rappel_assurance": flagRappelAssurance,
  };
}
