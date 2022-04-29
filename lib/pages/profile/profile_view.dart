import 'package:mykotche/utils/user_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/
import 'package:share/share.dart';

import '../../core.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: GetBuilder<ProfileController>(
        initState: (_) => controller.loadData(),
        builder: (_) => Stack(
          children: [
            Container(
              color: Colors.white,
              height: 100,
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //buildHeader(),
                      buildBody(),
                      buildActionButton(),
                      SizedBox(height: 25),
                      Divider(
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                      ),
                      SizedBox(height: 15),
                      /*nativeAdLarge1(),*/
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
           Obx(()=> AvatarWidget(
             photoURL: controller.currentusers.value.photoProfil, membership: 'null',progress: 0,
             //membership: controller.currentusers.value.,
             //progress: controller.userProfile.progress,
           ),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.7),
                      child: Obx(()=> Text(
                        controller.currentusers.value.name,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.7),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(
                              LineIcons.wallet,
                              size: 22,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Text(
                                  "IDR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey),
                                ),
                              ),
                             Obx(()=> Text(
                               controller.currentusers.value.celUsers,
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 16,
                               ),
                             ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => OpenDialog.info(
                  lottieFilename: LottieFileName.COMING_SOON,
                  lottiePadding: EdgeInsets.only(top: 50)),
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Colors.grey[300],
                    width: 1,
                  ),
                ),
                child: Icon(
                  LineIcons.userEdit,
                  color: Colors.black,
                  size: 29,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              /*buildItem(
                icon: LineIcons.envelope,
                name: "Email",
                data: controller.userProfile.email,
              ),*/
              Divider(),
              Obx(()=>buildItem(
                icon: LineIcons.user,
                name: "Nom",
                data: controller.currentusers.value.name,
              ),),
              Divider(),
              Obx(()=>buildItem(
                icon: LineIcons.user,
                name: "Prenom",
                data: controller.currentusers.value.prenomUsers,
              ),),
              Divider(),
              Obx(()=>buildItem(
                icon: LineIcons.phone,
                name: "Telephone",
                data: controller.currentusers.value.celUsers,
              ),),
              Divider(),
              Obx(()=>buildItem(
                icon: LineIcons.voicemail,
                name: "Email",
                data: controller.currentusers.value.email,
              ),),
              Divider(),
              /*buildItem(
                icon: LineIcons.calendar,
                name: "Birth of Date",
                data: ConverterHelper.stringFormatDmyHeader(
                    controller.userProfile.dob),
              ),*/
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              buildItem(
                onPressed: () => Share.share(
                    'Telecharger MyKotche :\nhttps://mykotche.net/item//31048680'),
                icon: LineIcons.gift,
                name: "Inviter un ami",
              ),
              Divider(),
              buildItem(
                /*onPressed: () => OpenDialog.info(
                    lottieFilename: LottieFileName.COMING_SOON,
                    lottiePadding: EdgeInsets.only(top: 50)),*/
                icon: LineIcons.cog,
                name: "Parametres",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItem({
    @required IconData icon,
    @required String name,
    String data,
    Function() onPressed,
  }) {
    return InkWell(
      onTap: data != null ? null : onPressed,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              icon,
              size: 29,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: data == null ? 20 : 18,
                      fontWeight: FontWeight.w500),
                ),
                data == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          data,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
          )),
          data != null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black45,
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          OpenDialog.confirm(
            content: "Voulez vous vous deconnectez?",
            lottieFilename: "thinking",
            onYesClicked: (){
              UserManagement.logoutUser().whenComplete(() => Get.offAllNamed(Routes.LOGIN));
            },
          );

         // UserManagement.logoutUser().whenComplete(() => Get.toNamed(Routes.LOGIN));

        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red[300],
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0.2,
          textStyle: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: Icon(
          LineIcons.alternateSignOut,
          size: 27,
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text("Se deconnecter a"),
        ),
      ),
    );
  }

  /*Widget nativeAdLarge1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: NativeAd(
        // Large Ads
        height: 320,
        unitId: AdSetUnitId.nativeAdUnitIdProfileScreen,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
            child: Material(
              elevation: 1.5,
              borderRadius: BorderRadius.circular(6),
              child: child,
            ),
          );
        },
        buildLayout: AdLayoutX.mediumAdTemplateLayoutBuilder,
        loading: Center(child: Text('Chargement en cours...')),
        error: Container(),
        icon: AdImageView(size: 40),
        headline: AdTextView(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          maxLines: 1,
        ),
        body: AdTextView(style: TextStyle(color: Colors.black), maxLines: 1),
        media: AdMediaView(
          height: 170,
          width: MATCH_PARENT,
        ),
        attribution: AdTextView(
          width: WRAP_CONTENT,
          text: 'Sponsored',
          decoration: AdDecoration(
            border: BorderSide(color: Colors.green, width: 2),
            borderRadius: AdBorderRadius.all(16.0),
          ),
          style: TextStyle(color: Colors.green),
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
        ),
        button: AdButtonView(
          elevation: 18,
          decoration: AdDecoration(
            borderRadius: AdBorderRadius.all(12),
            backgroundColor: Colors.yellowAccent[700],
          ),
          height: MATCH_PARENT,
          // textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }*/
}
