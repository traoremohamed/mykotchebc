// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.idService,
    this.libelleService,
    this.idTypeService,
    this.localisation,
    this.flagService,
    this.idUserSer,
    this.createdAt,
    this.updatedAt,
    this.libelleType,
    this.flagTypeService, String type,
  });

  String idService;
  String libelleService;
  String idTypeService;
  String localisation;
  String flagService;
  String idUserSer;
  DateTime createdAt;
  DateTime updatedAt;
  String libelleType;
  String flagTypeService;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    idService: json["id_service"],
    libelleService: json["libelle_service"],
    idTypeService: json["id_type_service"],
    localisation: json["localisation"],
    flagService: json["flag_service"],
    idUserSer: json["id_user_ser"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    libelleType: json["libelle_type"],
    flagTypeService: json["flag_type_service"],
  );

  Map<String, dynamic> toJson() => {
    "id_service": idService,
    "libelle_service": libelleService,
    "id_type_service": idTypeService,
    "localisation": localisation,
    "flag_service": flagService,
    "id_user_ser": idUserSer,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "libelle_type": libelleType,
    "flag_type_service": flagTypeService,
  };
}
