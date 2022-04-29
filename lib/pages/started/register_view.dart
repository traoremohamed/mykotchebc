import 'dart:async';
import 'dart:convert';
//import 'dart:html';

import 'package:mykotche/core.dart';
import 'package:mykotche/models/users.dart' as user;
import 'package:mykotche/pages/started/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mykotche/pages/services/env.dart';

class RegisterView extends StatelessWidget {

  RegisterController regCont = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 300,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildHeader(),
                    buildLoginForm(),
                    buildLoginAction(),
                    buildRegisterAction(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          ImagesWidget(
            heightImages: 200,
            images: [
              "assets/images/welcome/fast_car.png",
              "assets/images/welcome/vehicle_sale.png",
            ],
          ),
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TitleWidget(
              title: "Creation de compte",
              fontSizeTitle: 27,
              spacer: 8,
              subtitle:
                  "Voyagez et vivez la nouvelle expérience de gestion des voitures depuis chez vous",
            ),
          ),
          SizedBox(height: 13),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nom",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: regCont.tecNom,
            decoration: InputDecoration(
              hintText: "Votre Nom",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),

          ),
          SizedBox(height: 15),
          Text(
            "Prenom",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: regCont.tecPrenom,
            decoration: InputDecoration(
              hintText: "Votre Prenom",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),

          ),
          SizedBox(height: 15),

          Text(
            "Email",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: regCont.tecEmail,
            decoration: InputDecoration(
              hintText: "Votre email",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),

          ),
          SizedBox(height: 15),
          Text(
            "Contact",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: regCont.tecContact1,
            decoration: InputDecoration(
              hintText: "+225 0000000000",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),

          ),
          SizedBox(height: 15),
          Text(
            "Profession",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: regCont.tecProfession,
            decoration: InputDecoration(
              hintText: "Profession",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),

          ),
          SizedBox(height: 15),
          Text(
            "Mot de passe",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            obscureText: true,
            controller: regCont.tecPassword,
            decoration: InputDecoration(
              hintText: "********",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),

          ),
          SizedBox(height: 15),

          SizedBox(height: 23),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "En m'inscrivant, j'accepte les conditions d'utilisation et la politique de confidentialité de l'application de location de voitures.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildLoginAction() {
    return GestureDetector(
       onTap: () {
         regCont.creationcompte();
       },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          child: Obx(()=>Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "S'inscrire",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

              ),
              !regCont.isClickOnRegister.value?
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ) :
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),),
        ),
      ),
    );
  }

  Widget buildRegisterAction() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 17),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vous avez un compte?",
              style: TextStyle(fontSize: 17),
            ),
            TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "S'identifier",
                  style: TextStyle(fontSize: 17),
                )),
          ],
        ),
      ),
    );
  }
}
