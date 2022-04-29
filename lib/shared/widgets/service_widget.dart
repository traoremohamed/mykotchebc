import 'package:mykotche/core.dart';
import 'package:flutter/material.dart';
import 'package:mykotche/models/coderoute.dart';
import 'package:mykotche/models/numerourgence.dart';
import 'package:mykotche/models/service_used.dart';
import 'package:mykotche/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildService(Service service, Coderoute coderoute, [int index]) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColorShadow,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              child: Text(
                service != null ?
                service.localisation : "",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 11.7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 95,
          child: Center(
            child: Hero(
              tag: service != null ? service.libelleType +
                  service.libelleService
                  : coderoute.flagCode,
              child:
              service == null ?
                  Image.network(coderoute.imageCode)
                  :
              Image.asset(
                "assets/images/cars/mykotche.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          service != null ? service.libelleType : "",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          service != null ?
          service.libelleService : coderoute.libelleCodeRoute,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        Visibility(
          visible: service != null,
          child: Text(
            "per " +
                ( service != null && service.localisation == "Daily"
                    ? "day"
                    :
                service != null &&  service.localisation == "Weekly"
                        ? "week"
                        : "month"),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildUrgencyContact(Numerourgence numUr, [int index]) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                "",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 11.7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 75,
          child: Center(
            child: Hero(
              tag: numUr.flagNumUrg,
              child:
              Image.asset(
                "assets/images/urgence/imageurgence.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          numUr.libelleNumUrg,
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 8),
        Text(
          numUr.valeurNumUrg,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
       ElevatedButton.icon(
           onPressed: (){
         launch(('tel://${numUr.valeurNumUrg}'));
       },
           icon: Icon(Icons.phone),
           label: Text("Appeler"),
       style: ElevatedButton.styleFrom(
         primary: Colors.green
       ),)
      ],
    ),
  );
}
