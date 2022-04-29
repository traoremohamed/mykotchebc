import 'package:mykotche/core.dart';
import 'package:mykotche/models/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserManagement{
 static final box = GetStorage();


 static Future saveUser(Users loginUser) async{
    box.write('login_users', loginUser.toJson());
  }
 static readUser(){
   try{
     Map userMap = box.read('login_users');
     Users currentUser = Users.fromJson(userMap);

     debugPrint("Current name is ::: ${currentUser.name}");

     return currentUser;
   } catch(ex){
     debugPrint("User Management :: $ex");

   }

  }

 static Future logoutUser() async{
   box.remove("login_users");
   box.erase();
   Get.delete();
  }
}