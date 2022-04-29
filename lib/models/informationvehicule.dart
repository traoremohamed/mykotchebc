// To parse this JSON data, do
//
//     final informationvehicule = informationvehiculeFromJson(jsonString);

import 'dart:convert';

Informationvehicule informationvehiculeFromJson(String str) => Informationvehicule.fromJson(json.decode(str));

String informationvehiculeToJson(Informationvehicule data) => json.encode(data.toJson());

class Informationvehicule {
  Informationvehicule({
    this.idPers,
    this.nomPers,
    this.prenomPers,
    this.tel1Pers,
    this.tel2Pers,
    this.emailPers,
    this.professionPers,
    this.dateNaisPers,
    this.idQuartier,
    this.flagPers,
    this.updatedAt,
    this.createdAt,
    this.idVehicule,
    this.marqueVehicule,
    this.immatriculation,
    this.couleur,
    this.typeVehicule,
    this.flagVehicule,
    this.idVisite,
    this.dateDernierVisite,
    this.dateVisiteProchain,
    this.idVehiculee,
    this.idPersonne,
    this.lieuVisite,
    this.flagVisite,
    this.idAssurance,
    this.libelleAssurance,
    this.dateExpirationAssurance,
    this.dateRappelAssurance,
    this.flagRappelAssurance,
  });

  String idPers;
  String nomPers;
  String prenomPers;
  String tel1Pers;
  String tel2Pers;
  String emailPers;
  String professionPers;
  dynamic dateNaisPers;
  String idQuartier;
  String flagPers;
  DateTime updatedAt;
  DateTime createdAt;
  String idVehicule;
  String marqueVehicule;
  String immatriculation;
  String couleur;
  String typeVehicule;
  String flagVehicule;
  String idVisite;
  DateTime dateDernierVisite;
  DateTime dateVisiteProchain;
  String idVehiculee;
  String idPersonne;
  dynamic lieuVisite;
  String flagVisite;
  String idAssurance;
  String libelleAssurance;
  DateTime dateExpirationAssurance;
  DateTime dateRappelAssurance;
  String flagRappelAssurance;

  factory Informationvehicule.fromJson(Map<String, dynamic> json) => Informationvehicule(
    idPers: json["id_pers"],
    nomPers: json["nom_pers"],
    prenomPers: json["prenom_pers"],
    tel1Pers: json["tel1_pers"],
    tel2Pers: json["tel2_pers"],
    emailPers: json["email_pers"],
    professionPers: json["profession_pers"],
    dateNaisPers: json["date_nais_pers"],
    idQuartier: json["id_quartier"],
    flagPers: json["flag_pers"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    idVehicule: json["id_vehicule"],
    marqueVehicule: json["marque_vehicule"],
    immatriculation: json["immatriculation"],
    couleur: json["couleur"],
    typeVehicule: json["type_vehicule"],
    flagVehicule: json["flag_vehicule"],
    idVisite: json["id_visite"],
    dateDernierVisite: DateTime.parse(json["date_dernier_visite"]),
    dateVisiteProchain: DateTime.parse(json["date_visite_prochain"]),
    idVehiculee: json["id_vehiculee"],
    idPersonne: json["id_personne"],
    lieuVisite: json["lieu_visite"],
    flagVisite: json["flag_visite"],
    idAssurance: json["id_assurance"],
    libelleAssurance: json["libelle_assurance"],
    dateExpirationAssurance: DateTime.parse(json["date_expiration_assurance"]),
    dateRappelAssurance: DateTime.parse(json["date_rappel_assurance"]),
    flagRappelAssurance: json["flag_rappel_assurance"],
  );

  Map<String, dynamic> toJson() => {
    "id_pers": idPers,
    "nom_pers": nomPers,
    "prenom_pers": prenomPers,
    "tel1_pers": tel1Pers,
    "tel2_pers": tel2Pers,
    "email_pers": emailPers,
    "profession_pers": professionPers,
    "date_nais_pers": dateNaisPers,
    "id_quartier": idQuartier,
    "flag_pers": flagPers,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id_vehicule": idVehicule,
    "marque_vehicule": marqueVehicule,
    "immatriculation": immatriculation,
    "couleur": couleur,
    "type_vehicule": typeVehicule,
    "flag_vehicule": flagVehicule,
    "id_visite": idVisite,
    "date_dernier_visite": "${dateDernierVisite.year.toString().padLeft(4, '0')}-${dateDernierVisite.month.toString().padLeft(2, '0')}-${dateDernierVisite.day.toString().padLeft(2, '0')}",
    "date_visite_prochain": "${dateVisiteProchain.year.toString().padLeft(4, '0')}-${dateVisiteProchain.month.toString().padLeft(2, '0')}-${dateVisiteProchain.day.toString().padLeft(2, '0')}",
    "id_vehiculee": idVehiculee,
    "id_personne": idPersonne,
    "lieu_visite": lieuVisite,
    "flag_visite": flagVisite,
    "id_assurance": idAssurance,
    "libelle_assurance": libelleAssurance,
    "date_expiration_assurance": "${dateExpirationAssurance.year.toString().padLeft(4, '0')}-${dateExpirationAssurance.month.toString().padLeft(2, '0')}-${dateExpirationAssurance.day.toString().padLeft(2, '0')}",
    "date_rappel_assurance": "${dateRappelAssurance.year.toString().padLeft(4, '0')}-${dateRappelAssurance.month.toString().padLeft(2, '0')}-${dateRappelAssurance.day.toString().padLeft(2, '0')}",
    "flag_rappel_assurance": flagRappelAssurance,
  };
}
