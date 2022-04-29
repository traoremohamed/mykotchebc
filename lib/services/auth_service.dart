import 'package:flutter/foundation.dart';
import 'package:mykotche/pages/services/env.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dio;



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

  Future register(String Nom, String Prenom, String Contact1, String Email, String Profession, String Password) async{
    try{
      //print('errrrorrrr');
      dio = new Dio();
      var response = await dio.post(Env.URI_REGISTER, data: {
        'nom_pers': Nom,
        'prenom_pers': Prenom,
        'tel1_pers': Contact1,
        'email': Email,
        'profession_pers': Profession,
        'password': Password
      });

      print(response.toString());

      if(response.statusCode != 200){
        print('probleme du serveur');
      }else{
        return response;
      }

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }
  }

  comptevehicule(String Immatriculation, String Marque, String Couleur, String TypeVehicule, String DatedernierVisite,
      String DateprochainVisite, String DaterappelprochainVisite, String LibelleAssurance, String DateDernierAssurance, String DateProchianAssurance, String DaterappelProchianAssurance, String Idpersonne) async{

    try{

      dio = new Dio();

      print("${DateProchianAssurance}");
      
      var response = await dio.post(Env.URI_CREER_VEHICULE, data: {
        'marque_vehicule': Marque,
        'immatriculation': Immatriculation,
        'couleur': Couleur,
        'id_personne': Idpersonne,
        'type_vehicule': TypeVehicule,
        'date_dernier_visite': DatedernierVisite,
        'date_visite_prochain': DateprochainVisite,
        'date_rappel_visite_prochain': DaterappelprochainVisite,
        'libelle_assurance': LibelleAssurance,
        'date_expiration_assurance': DateDernierAssurance,
        'date_rappel_assurance': DateProchianAssurance,
        'date_rappel_rappel_assurance': DaterappelProchianAssurance,
      });

      //T'as oublie de retourner la reponse
      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }
  }

  ///ca c'est le service
  informationvehicule(String Idpers) async{

    try{

      dio = new Dio();


      var response = await dio.get(Env.URI_INFOS_VEHICULE +"$Idpers");

      print("Current Url is : ${Env.URI_INFOS_VEHICULE +"$Idpers"}");

      //var response = await dio.get(Env.URI_INFOS_VEHICULE,  queryParameters: {'id': Idpers});

      print('User Info: ${response.data}');

      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }

  }

  ///ca c'est le service
  informationunseulvehicule(String Idpers) async{

    try{

      dio = new Dio();


      var response = await dio.get(Env.URI_INFOS_VEHICULE_FIRST +"$Idpers");

      debugPrint("===============================================>");
      debugPrint("Current Info Vehicule Url is : ${Env.URI_INFOS_VEHICULE_FIRST +"$Idpers"}");

      //var response = await dio.get(Env.URI_INFOS_VEHICULE,  queryParameters: {'id': Idpers});

      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }

  }

  ///ca c'est le service
  informationvisite(String Idpers) async{

    try{

      dio = new Dio();


      var response = await dio.get(Env.URI_INFOS_VISITE +"$Idpers");

      print("Current INFOS VISITE Url is : ${Env.URI_INFOS_VISITE +"$Idpers"}");

      //var response = await dio.get(Env.URI_INFOS_VEHICULE,  queryParameters: {'id': Idpers});

      print('User Info Visite: ${response.data}');

      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }

  }


  ///ca c'est le service
  informationassurance(String Idpers) async{

    try{

      dio = new Dio();


      var response = await dio.get(Env.URI_INFOS_ASSURANCE +"$Idpers");

      print("Current Url is : ${Env.URI_INFOS_ASSURANCE +"$Idpers"}");

      //var response = await dio.get(Env.URI_INFOS_VEHICULE,  queryParameters: {'id': Idpers});

      print('User Info: ${response.data}');

      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }

  }

  ///ca c'est le service
  service() async{

    try{

      dio = new Dio();


      var response = await dio.get(Env.URI_SERVICE);


      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }

  }

  ///ca c'est le service
  numerourgence() async{

    try{

      dio = new Dio();


      var response = await dio.get(Env.URI_NUMERO_URGENCE);


      print('User Info: ${response.data}');

      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }

  }

  ///ca c'est le service
  coderoute() async{

    try{

      dio = new Dio();


      var response = await dio.get(Env.URI_CODE_ROUTE);


      print('User Info: ${response.data}');

      return response;

    }on DioError catch(ex){
      print(ex.response.statusCode);
      return ex.response;
    }

  }

}