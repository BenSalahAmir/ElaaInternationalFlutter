import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_doctordetails.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_favourite.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_notification.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_search.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_topdoctor.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicaHome extends StatefulWidget {
  const MedicaHome({Key? key}) : super(key: key);

  @override
  State<MedicaHome> createState() => _MedicaHomeState();
}

class _MedicaHomeState extends State<MedicaHome> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int selected = 0;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> specialname = ["Remorquage","Hospitalisation","Électricien","Avocat","Expertise","Plomberie","Reparation","Plus"];
  List<String> specialimg = [MedicaPngImg.remorquage,MedicaPngImg.Hospitalisation,MedicaPngImg.electricien,MedicaPngImg.Avocat,MedicaPngImg.expertice,MedicaPngImg.Plomberie,MedicaPngImg.Reparation,MedicaPngImg.speciality8];
  List<String> category = ["All","Routiere","Domiciliaire","Médicale","Voyage","Juridique"];
  List<String> doctorname = ["Dr.Travis Westaby","Dr.Nathaniel Valle","Dr.Beckett Calger","Dr.Jada Srnsky","Dr.Bernard Bliss"];
  List<String> doctorimg = [MedicaPngImg.doctor2,MedicaPngImg.doctor1,MedicaPngImg.doctor3,MedicaPngImg.doctor5,MedicaPngImg.doctor4];
  String? username;



  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
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
        toolbarHeight: height/10,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(MedicaPngImg.photo),
              ),
              SizedBox(width: width/26,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height/120,),
                  Text("Bonjour 👋".tr,style: urbanistRegular.copyWith(fontSize: 16 )),
                  SizedBox(height: height/120,),
                  Text(username ?? "Guest", style: urbanistBold.copyWith(fontSize: 16 )),
                ],
              ),
              const Spacer(),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                /*onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaNotification();
                  },));
                },*/
                child: Image.asset(MedicaPngImg.notification,height: height/36,color: themedata.isdark?Medicacolor.white:Medicacolor.black,),
              ),
              SizedBox(width: width/16),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
               /* onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaFavourite();
                  },));
                },*/
                child: Image.asset(MedicaPngImg.wishlist,height: height/30,color: themedata.isdark?Medicacolor.white:Medicacolor.black,),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/96),
          child: Column(
            children: [
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                /*
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaSearch();
                  },));
                },*/
                child: Container(
                  height: height/15,
                  width: width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/26),
                    child: Row(
                      children: [
                        Image.asset(MedicaPngImg.search,height: height/36),
                        SizedBox(width: width/16),
                        Text("Recherche".tr,style: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                        const Spacer(),
                        Image.asset(MedicaPngImg.filter,height: height/46,color: Medicacolor.primary),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Container(
                height: height/4.5,
                 width: width/1,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(25),
                   color: Medicacolor.primary,
                 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height/46,horizontal: width/36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Passion for the best".tr,style: urbanistBold.copyWith(fontSize: 20,color: Medicacolor.white)),
                          SizedBox(height: height/96),
                          SizedBox(
                            width: width/1.7,
                            child: Text("Elaa International vous propose une solution complete des prestations de services Technique Domiciliare Medical et voyage. Cette application vous permet un acces direct à nos services.",
                              style: urbanistLight.copyWith(fontSize: 11,color: Medicacolor.white)),
                          ),
                          SizedBox(height: height/56),
                         /* Container(
                            height: height/29,
                            width: width/3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Medicacolor.white,
                            ),
                            child: Center(child: Text("Vérifie maintenant",style: urbanistSemiBold.copyWith(fontSize: 6,color: Medicacolor.primary),)),
                          ),*/
                        ],
                      ),
                    ),
                    Image.asset(MedicaPngImg.imghome,height: height/5),
                  ],
                ),
              ),
              SizedBox(height: height/36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Services d'assurance".tr,style: urbanistBold.copyWith(fontSize: 20)),
                  Text("Voir tout".tr,style: urbanistBold.copyWith(fontSize: 14,color: Medicacolor.primary)),
                ],
              ),
              SizedBox(height: height/46),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: specialname.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: (height / 3.8) / (width / 1.8)),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(
                          specialimg[index],
                          height: height / 36,
                          color: Medicacolor.primary,
                        ),
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Text(
                        specialname[index],
                        style: urbanistMedium.copyWith(fontSize: 14),
                        maxLines: 1,overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: height/36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Type des prestations".tr,style: urbanistBold.copyWith(fontSize: 20)),
                  InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                      /*
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const MedicaTopdoctor();
                        },));
                      },*/
                      child: Text("Voir tout".tr,style: urbanistBold.copyWith(fontSize: 14,color: Medicacolor.primary))),
                ],
              ),
              SizedBox(height: height/36),
              SizedBox(
                height: height / 20,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Medicacolor.transparent,
                        highlightColor: Medicacolor.transparent,
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Container(
                          height: height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all( color: selected == index
                                  ? Medicacolor.transparent
                                  : Medicacolor.primary),
                              color: selected == index
                                  ? Medicacolor.primary
                                  : Medicacolor.transparent),
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width / 16),
                            child: Center(
                              child: Text(category[index],
                                  style: urbanistMedium.copyWith(
                                      fontSize: 16,
                                      color: selected == index
                                          ? Medicacolor.white
                                          : Medicacolor.primary)),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: width / 36,
                      );
                    },
                    itemCount: category.length),
              ),
              SizedBox(height: height/36),
            ],
          ),
        ),
      ),
    );
  }
}
