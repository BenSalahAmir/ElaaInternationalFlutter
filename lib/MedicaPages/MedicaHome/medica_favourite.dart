import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHistory/AddReviewPage.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_doctordetails.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaFavourite extends StatefulWidget {
  const MedicaFavourite({Key? key}) : super(key: key);

  @override
  State<MedicaFavourite> createState() => _MedicaFavouriteState();
}

class _MedicaFavouriteState extends State<MedicaFavourite> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> doctorname = ["Dr.Travis Westaby","Dr.Nathaniel Valle","Dr.Beckett Calger","Dr.Jada Srnsky","Dr.Bernard Bliss"];
  List<String> doctorimg = [MedicaPngImg.doctor2,MedicaPngImg.doctor1,MedicaPngImg.doctor3,MedicaPngImg.doctor5,MedicaPngImg.doctor4];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          children: [
            Text("My_Favorite_Doctor".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.search,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width/26),
            Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: doctorname.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const AddReviewPage();
                      },));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: height/36),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
                        boxShadow:  [
                          BoxShadow(
                          blurRadius: 5,
                            color: themedata.isdark ? Medicacolor.transparent : Medicacolor.lightgrey,
                        )]
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(doctorimg[index].toString(),height: height/8,width: height/8,fit: BoxFit.fill,),
                            ),
                            SizedBox(
                              width: width/1.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(doctorname[index].toString(),style: urbanistBold.copyWith(fontSize: 18)),
                                      InkWell(
                                        splashColor: Medicacolor.transparent,
                                        highlightColor: Medicacolor.transparent,
                                          onTap: () {
                                            removefavourite();
                                            },
                                          child: Image.asset(MedicaPngImg.heart,height: height/46,color: Medicacolor.primary,)),
                                    ],
                                  ),
                                  SizedBox(height: height/86),
                                  Container(
                                    height: height/500,
                                    width: width/1.5,
                                    color:  themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,
                                  ),
                                  SizedBox(height: height/76),
                                  Text("Cardilogists  |  Alka Hospital",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                  SizedBox(height: height/86),
                                  Row(
                                    children: [
                                      const Icon(Icons.star_rate_rounded,size: 15,color: Medicacolor.primary),
                                      SizedBox(width: width/96),
                                      Text("4.3 (5.376 reviews)",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },)
            ],
          ),
        ),
      ),
    );
  }
  removefavourite() {
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
                  height: height /2.7,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                    child: Column(
                      children: [
                        Text("Remove_From_Favorites".tr,style: urbanistBold.copyWith(fontSize: 20)),
                        SizedBox(height: height/96),
                        Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                        SizedBox(height: height/76),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: themedata.isdark ? Medicacolor.black :  Medicacolor.white,
                              boxShadow:  [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: themedata.isdark ? Medicacolor.transparent : Medicacolor.lightgrey,
                                )]
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(MedicaPngImg.doctor2,height: height/8,width: height/8,fit: BoxFit.fill,),
                                ),
                                SizedBox(
                                  width: width/1.7,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Dr.Travis Westaby",style: urbanistBold.copyWith(fontSize: 18)),
                                          InkWell(
                                              splashColor: Medicacolor.transparent,
                                              highlightColor: Medicacolor.transparent,
                                              onTap: () {
                                              },
                                              child: Image.asset(MedicaPngImg.heart,height: height/46,color: Medicacolor.primary,)),
                                        ],
                                      ),
                                      SizedBox(height: height/86),
                                      Container(
                                        height: height/500,
                                        width: width/1.5,
                                        color:  themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,
                                      ),
                                      SizedBox(height: height/76),
                                      Text("Cardilogists  |  Alka Hospital",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                      SizedBox(height: height/86),
                                      Row(
                                        children: [
                                          const Icon(Icons.star_rate_rounded,size: 15,color: Medicacolor.primary),
                                          SizedBox(width: width/96),
                                          Text("4.3 (5.376 reviews)",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                child: Center(child: Text("Cancel".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary),)),
                              ),
                            ),
                            InkWell(
                              splashColor: Medicacolor.transparent,
                              highlightColor: Medicacolor.transparent,
                              onTap: () {
                              },
                              child: Container(
                                height: height/16,
                                width: width/2.2,
                                decoration: BoxDecoration(
                                  color: Medicacolor.primary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(child: Text("Yes_Remove".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
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
}
