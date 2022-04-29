import 'package:mykotche/pages/services/env.dart';
import 'package:dio/dio.dart';


// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {

  Users({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.flagMdp,
    this.genreUsers,
    this.celUsers,
    this.telUsers,
    this.localisationUsers,
    this.adresseUsers,
    this.prenomUsers,
    this.idPartenaire,
    this.photoProfil,
    this.indicatifTelUsers,
    this.indicatifCelUsers,
    this.flagActifUsers,
    this.flagDemissionUsers,
    this.flagAdminUsers,
    this.idcommn1,
  });

  Users.empty();
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String flagMdp;
  dynamic genreUsers;
  String celUsers;
  dynamic telUsers;
  dynamic localisationUsers;
  dynamic adresseUsers;
  dynamic prenomUsers;
  String idPartenaire;
  dynamic photoProfil;
  dynamic indicatifTelUsers;
  dynamic indicatifCelUsers;
  String flagActifUsers;
  String flagDemissionUsers;
  String flagAdminUsers;
  dynamic idcommn1;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    flagMdp: json["flag_mdp"],
    genreUsers: json["genre_users"],
    celUsers: json["cel_users"],
    telUsers: json["tel_users"],
    localisationUsers: json["localisation_users"],
    adresseUsers: json["adresse_users"],
    prenomUsers: json["prenom_users"],
    idPartenaire: json["id_partenaire"],
    photoProfil: json["photo_profil"],
    indicatifTelUsers: json["indicatif_tel_users"],
    indicatifCelUsers: json["indicatif_cel_users"],
    flagActifUsers: json["flag_actif_users"],
    flagDemissionUsers: json["flag_demission_users"],
    flagAdminUsers: json["flag_admin_users"],
    idcommn1: json["idcommn1"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "flag_mdp": flagMdp,
    "genre_users": genreUsers,
    "cel_users": celUsers,
    "tel_users": telUsers,
    "localisation_users": localisationUsers,
    "adresse_users": adresseUsers,
    "prenom_users": prenomUsers,
    "id_partenaire": idPartenaire,
    "photo_profil": photoProfil,
    "indicatif_tel_users": indicatifTelUsers,
    "indicatif_cel_users": indicatifCelUsers,
    "flag_actif_users": flagActifUsers,
    "flag_demission_users": flagDemissionUsers,
    "flag_admin_users": flagAdminUsers,
    "idcommn1": idcommn1,
  };
}



/*class Users {
  Dio dio;
   int id;
   String name;
   String prenom_users;
   String email;
   String cel_users;
   String id_partenaire;
   String password;

  Users.empty();

  Users(this.id, this.name, this.prenom_users, this.email, this.cel_users,
      this.id_partenaire, this.password);

 Future login(String Email, String Password) async {

    try{
      dio = new Dio();
      var response = await dio.post(Env.URI_LOGIN, data: {
        'email' : Email,
        'password' : Password
      });

      if (response.statusCode != 200){
        print('probleme de connexion');
      }else{
        return response;
      }
    }on DioError catch (ex){
      print(ex.response.statusCode);
      return ex.response;
    }
  }
}*/
