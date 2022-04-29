

import 'package:get/get.dart';
import 'package:mykotche/pages/vehicule/vehicule_controller.dart';
import 'package:mykotche/shared/widgets/images_widget.dart';
import 'package:mykotche/shared/widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../core.dart';


class VehiculeView extends GetView<VehiculeController> {
  String _userBirthday;

  var birthDate;

  VehiculeController vehConst = Get.put(VehiculeController());

  bool isDateSelected;

  //const VehiculeView({Key? key}) : super(key: key);

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
                    buildVehiculeForm(context),
                    buildVehiculeAction(),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(){
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
          _buildAppBar(),
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
              title: "Creation de vehicule",
              fontSizeTitle: 27,
              spacer: 8,
              subtitle:
              "Creer votre vehicule et gerer votre rappel",
            ),
          ),
          SizedBox(height: 13),
        ],
      ),
    );
  }


  Widget _buildAppBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                     GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey[300],
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 28,
                      )),
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget buildVehiculeForm(context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Immatriculation",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: vehConst.tecImmatriculation,
            decoration: InputDecoration(
              hintText: "Immatriculation vehicule",
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
            "Marque",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: vehConst.tecMarque,
            decoration: InputDecoration(
              hintText: "Marque vehicule",
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
            "Couleur",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: vehConst.tecCouleur,
            decoration: InputDecoration(
              hintText: "Couleur vehicule",
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
            "Type Vehicule",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            controller: vehConst.tecTypeVehicule,
            decoration: InputDecoration(
              hintText: "Type du vehicule",
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
            "Date de la dernière visite",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            //  style: TextStyle(fontFamily: ),
            cursorColor: CupertinoTheme.of(context).primaryColor,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4)
                ),
                labelText: "Date de la dernière visite",
                suffix: GestureDetector(
                    child: new Icon(
                      Icons.calendar_today,
                      color: CupertinoTheme
                          .of(context)
                          .primaryColor,
                    ),
                    onTap: () async {
                      final datePick = await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100));
                      if (datePick != null && datePick != birthDate) {

                        birthDate = datePick;

                        vehConst.tecDatederniervisite.text = "${birthDate.day}/${birthDate
                            .month}/${birthDate.year}"; // 08/14/2019

                      }
                    })),
            maxLines: null,

            onSaved: (String birthday) {
              print('Date chosen $birthday');
              this._userBirthday = birthday;
            },
            controller: vehConst.tecDatederniervisite,
            validator: (input) {
              if (input.isEmpty) {
                return "Le champ est vide";
              } else if (input.length < 8) {
                return "Le nombre de caractères n’est pas atteint";
              }
              return null;
            },
            //controller: regCont.tecPassword,


          ),
          SizedBox(height: 15),
          Text(
            "Date de la prochaine visite",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            //  style: TextStyle(fontFamily: ),
            cursorColor: CupertinoTheme.of(context).primaryColor,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4)
                ),
                labelText: "Date de la prochaine visite",
                suffix: GestureDetector(
                    child: new Icon(
                      Icons.calendar_today,
                      color: CupertinoTheme
                          .of(context)
                          .primaryColor,
                    ),
                    onTap: () async {
                      final datePick = await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100));
                      if (datePick != null && datePick != birthDate) {

                        birthDate = datePick;

                        vehConst.tecDateprochainvisite.text = "${birthDate.day}/${birthDate
                            .month}/${birthDate.year}"; // 08/14/2019

                      }
                    })),
            maxLines: null,

            onSaved: (String birthday) {
              print('Date chosen $birthday');
              this._userBirthday = birthday;
            },
            controller: vehConst.tecDateprochainvisite,
            validator: (input) {
              if (input.isEmpty) {
                return "Le champ est vide";
              } else if (input.length < 8) {
                return "Le nombre de caractères n’est pas atteint";
              }
              return null;
            },
            //controller: regCont.tecPassword,


          ),
          SizedBox(height: 15),

          SizedBox(height: 15),
          Text(
            "Date de rappel de la prochaine visite",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            //  style: TextStyle(fontFamily: ),
            cursorColor: CupertinoTheme.of(context).primaryColor,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4)
                ),
                labelText: "Date rappel de la prochaine visite",
                suffix: GestureDetector(
                    child: new Icon(
                      Icons.calendar_today,
                      color: CupertinoTheme
                          .of(context)
                          .primaryColor,
                    ),
                    onTap: () async {
                      final datePick = await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100));
                      if (datePick != null && datePick != birthDate) {

                        birthDate = datePick;

                        vehConst.tecDaterappelprochainvisite.text = "${birthDate.day}/${birthDate
                            .month}/${birthDate.year}"; // 08/14/2019

                      }
                    })),
            maxLines: null,

            onSaved: (String birthday) {
              print('Date chosen $birthday');
              this._userBirthday = birthday;
            },
            controller: vehConst.tecDaterappelprochainvisite,
            validator: (input) {
              if (input.isEmpty) {
                return "Le champ est vide";
              } else if (input.length < 8) {
                return "Le nombre de caractères n’est pas atteint";
              }
              return null;
            },
            //controller: regCont.tecPassword,


          ),
          SizedBox(height: 15),

          SizedBox(height: 15),
          Text(
            "Libelle assurance",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(

            controller: vehConst.tecLibelleassurance,
            decoration: InputDecoration(
              hintText: "Libelle assurance",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),

          ),
          SizedBox(height: 15),

          SizedBox(height: 15),
          Text(
            "Date de la dernière assurance",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
          //  style: TextStyle(fontFamily: ),
            cursorColor: CupertinoTheme.of(context).primaryColor,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4)
              ),
              labelText: "Date de la dernière assurance",
            suffix: GestureDetector(
            child: new Icon(
              Icons.calendar_today,
              color: CupertinoTheme
                  .of(context)
                  .primaryColor,
            ),
              onTap: () async {
                final datePick = await showDatePicker(
                    context: context,
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime(1900),
                    lastDate: new DateTime(2100));
                if (datePick != null && datePick != birthDate) {

                    birthDate = datePick;

                    vehConst.tecDatedernierassurance.text = "${birthDate.day}/${birthDate
                        .month}/${birthDate.year}"; // 08/14/2019

                }
              })),
            maxLines: null,

            onSaved: (String birthday) {
              print('Date chosen $birthday');
              this._userBirthday = birthday;
            },
            controller: vehConst.tecDatedernierassurance,
            validator: (input) {
              if (input.isEmpty) {
                return "Le champ est vide";
              } else if (input.length < 8) {
              return "Le nombre de caractères n’est pas atteint";
              }
              return null;
            },
            //controller: regCont.tecPassword,
         

          ),
          SizedBox(height: 15),

          SizedBox(height: 15),
          Text(
            "Date de la prochaine assurance",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            //  style: TextStyle(fontFamily: ),
            cursorColor: CupertinoTheme.of(context).primaryColor,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4)
                ),
                labelText: "Date de la prochaine assurance",
                suffix: GestureDetector(
                    child: new Icon(
                      Icons.calendar_today,
                      color: CupertinoTheme
                          .of(context)
                          .primaryColor,
                    ),
                    onTap: () async {
                      final datePick = await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100));
                      if (datePick != null && datePick != birthDate) {

                        birthDate = datePick;

                        vehConst.tecDateprochianassurance.text = "${birthDate.day}/${birthDate
                            .month}/${birthDate.year}"; // 08/14/2019

                      }
                    })),
            maxLines: null,

            onSaved: (String birthday) {
              print('Date chosen $birthday');
              this._userBirthday = birthday;
            },
            controller: vehConst.tecDateprochianassurance,
            validator: (input) {
              if (input.isEmpty) {
                return "Le champ est vide";
              } else if (input.length < 8) {
                return "Le nombre de caractères n’est pas atteint";
              }
              return null;
            },
            //controller: regCont.tecPassword,


          ),
          SizedBox(height: 15),

          SizedBox(height: 15),
          Text(
            "Date de rappel de la prochaine assurance",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            //  style: TextStyle(fontFamily: ),
            cursorColor: CupertinoTheme.of(context).primaryColor,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4)
                ),
                labelText: "Date de rappel de la prochaine assurance",
                suffix: GestureDetector(
                    child: new Icon(
                      Icons.calendar_today,
                      color: CupertinoTheme
                          .of(context)
                          .primaryColor,
                    ),
                    onTap: () async {
                      final datePick = await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100));
                      if (datePick != null && datePick != birthDate) {

                        birthDate = datePick;

                        vehConst.tecDaterappelprochianassurance.text = "${birthDate.day}/${birthDate
                            .month}/${birthDate.year}"; // 08/14/2019

                      }
                    })),
            maxLines: null,

            onSaved: (String birthday) {
              print('Date chosen $birthday');
              this._userBirthday = birthday;
            },
            controller: vehConst.tecDaterappelprochianassurance,
            validator: (input) {
              if (input.isEmpty) {
                return "Le champ est vide";
              } else if (input.length < 8) {
                return "Le nombre de caractères n’est pas atteint";
              }
              return null;
            },
            //controller: regCont.tecPassword,


          ),
          SizedBox(height: 15),
          SizedBox(height: 15),
          Visibility(
            visible: false,
            child: TextField(

              //controller: regCont.tecPassword,
             // initialValue: controller.currentusers.value.idPartenaire,

              decoration: InputDecoration(
              ),

            ),
          ),

          SizedBox(height: 15),

          SizedBox(height: 23),
         /* Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "En m'inscrivant, j'accepte les conditions d'utilisation et la politique de confidentialité de l'application de location de voitures.",
              style: TextStyle(fontSize: 16),
            ),
          ),*/
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildVehiculeAction(){
    return GestureDetector(
      onTap: () {
        vehConst.creationvehicule();
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
          child: Obx(()=>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Enregister",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                  ),

                  !vehConst.isClickOnVehicule.value?
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
                  ):
                  CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
              ),),
        ),
      ),
    );
  }
}
