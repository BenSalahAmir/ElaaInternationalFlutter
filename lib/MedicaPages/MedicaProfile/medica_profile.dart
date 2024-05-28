import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_login.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_notification.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_helpcenter.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_invitefriends.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_language.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_payments.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_editprofile.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_profilenotification.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_security.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicaProfile extends StatefulWidget {
  const MedicaProfile({Key? key}) : super(key: key);

  @override
  State<MedicaProfile> createState() => _MedicaProfileState();
}

class _MedicaProfileState extends State<MedicaProfile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  bool isDark = true;
  final themedata = Get.put(MedicaThemecontroler());


  String? username;
  String? Adressemail;




  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      Adressemail = prefs.getString('email');


    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/1,
        leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: width/26),
            child: Row(
              children: [
                Image.asset(
                    MedicaPngImg.logowithoutback,
                    height: height/26),
                SizedBox(width: width/16),
                Text("Profil".tr,style: urbanistBold.copyWith(fontSize: 24)),
                const Spacer(),
                Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
              ],
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(MedicaPngImg.photo),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: height/26,
                          height: height/26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Medicacolor.primary
                          ),
                          child: const Icon(Icons.edit_sharp,size: 22,color: Medicacolor.white,),
                        ))
                  ],
                ),
              ),
              SizedBox(height: height/46,),
              Text(username ?? "Guest", style: urbanistBold.copyWith(fontSize: 19 )),
              SizedBox(height: height/96,),
              Text(Adressemail ?? "+1 111 467 378 399".tr,style: urbanistBold.copyWith(fontSize: 14)),
              SizedBox(height: height/36,),
              Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
              SizedBox(height: height/46),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaEditprofile();
                  },));
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.profile,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/26),
                    Text("Modifier votre profil".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down,size: 20),
                  ],
                ),
              ),
              SizedBox(height: height/32),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaNotification();
                  },));
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.notification,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/26),
                    Text("Notification".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                  ],
                ),
              ),
              SizedBox(height: height/32),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaPayments();
                  },));
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.wallet,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/26),
                    Text("Paiement".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                  ],
                ),
              ),
              SizedBox(height: height/32),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaSecurity();
                  },));
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.security,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/26),
                    Text("Sécurité".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                  ],
                ),
              ),
              SizedBox(height: height/32),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  changelayout();
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.swap,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/36),
                    Text("Changer la disposition".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                  ],
                ),
              ),
              SizedBox(height: height/36),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaLanguage();
                  },));
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.language,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/26),
                    Text("Langue".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    Text("français (Fr)",style: urbanistSemiBold.copyWith(fontSize: 14)),
                    SizedBox(width: width/26),
                    const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                  ],
                ),
              ),
              SizedBox(height: height/36),
              Row(
                children: [
                  Image.asset(MedicaPngImg.darkmode,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                  SizedBox(width: width/26),
                  Text("Mode sombre".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  SizedBox(
                    height: height/22,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            themedata.changeTheme(state);
                            isDark = state;
                            themedata.update();
                          });
                        },
                        value: themedata.isdark),
                  ),
                ],
              ),
              SizedBox(height: height/36),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaHelpcenter();
                  },));
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.about,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/26),
                    Text("Centre d'aide".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                  ],
                ),
              ),
              SizedBox(height: height/32),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaInvitefriends();
                  },));
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.invitefrd,height: height/36,width: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                    SizedBox(width: width/26),
                    Text("Inviter des amis".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                  ],
                ),
              ),
              SizedBox(height: height/32),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  logoutuser();
                },
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.logout,height: height/36,width: height/36),
                    SizedBox(width: width/26),
                    Text("Se déconnecter".tr,style: urbanistSemiBold.copyWith(fontSize: 18,color: Medicacolor.red)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  logoutuser() {
    showModalBottomSheet(
        backgroundColor: Medicacolor.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  decoration: BoxDecoration(
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  ),
                  height: height / 3.5,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                    child: Column(
                      children: [
                        Text("Se déconnecter".tr,style: urbanistBold.copyWith(fontSize: 24,color: Medicacolor.red)),
                        SizedBox(height: height/96),
                        Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                        SizedBox(height: height/96),
                        Text("Êtes-vous sûr de vouloir vous déconnecter".tr,style: urbanistBold.copyWith(fontSize: 17),textAlign: TextAlign.center,),
                        SizedBox(height: height/96),
                        Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                        // SizedBox(height: height/96),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Medicacolor.transparent,
                              highlightColor: Medicacolor.transparent,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: height/16,
                                width: width/2.3,
                                decoration: BoxDecoration(
                                  color: themedata.isdark ? Medicacolor.lblack  : Medicacolor.lightprimary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(child: Text("Annuler".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary),)),
                              ),
                            ),
                            InkWell(
                              splashColor: Medicacolor.transparent,
                              highlightColor: Medicacolor.transparent,
                              onTap: () async {
                                // Clear SharedPreferences
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                await prefs.clear();

                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const MedicaLogin();
                                },));
                              },
                              child: Container(
                                height: height/16,
                                width: width/2.2,
                                decoration: BoxDecoration(
                                  color: Medicacolor.primary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(child: Text("Oui Déconnexion".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }

  changelayout() {
    showModalBottomSheet(
        backgroundColor: Medicacolor.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  decoration: BoxDecoration(
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  ),
                  height: height / 4,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text("sélectionner la présentation de l'application".tr,
                            style: urbanistBold.copyWith(
                              fontSize: 18,
                            )),
                      ),
                      Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: Medicacolor.transparent,
                          splashColor: Medicacolor.transparent,
                          onTap: () async {
                            await Get.updateLocale(const Locale('en', 'US'));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ltr'.tr,
                                style: urbanistMedium.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: Medicacolor.transparent,
                          splashColor: Medicacolor.transparent,
                          onTap: () async {
                            await Get.updateLocale(const Locale('ar', 'ab'));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'rtl'.tr,
                                style: urbanistMedium.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: Medicacolor.transparent,
                          splashColor: Medicacolor.transparent,
                          onTap: () async {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Annuler'.tr,
                                style: urbanistMedium.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
