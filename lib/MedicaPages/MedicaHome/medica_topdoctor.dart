import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHistory/AddReviewPage.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_doctordetails.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaTopdoctor extends StatefulWidget {
  const MedicaTopdoctor({Key? key}) : super(key: key);

  @override
  State<MedicaTopdoctor> createState() => _MedicaTopdoctorState();
}

class _MedicaTopdoctorState extends State<MedicaTopdoctor> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int selected = 0;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> doctorname = ["Dr.Travis Westaby","Dr.Nathaniel Valle","Dr.Beckett Calger","Dr.Jada Srnsky","Dr.Bernard Bliss"];
  List<String> doctorimg = [MedicaPngImg.doctor2,MedicaPngImg.doctor1,MedicaPngImg.doctor3,MedicaPngImg.doctor5,MedicaPngImg.doctor4];
  List<String> category = ["All","General","Dentist","Nutritionist","ophthalmology","Pediatric","Radiology"];

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
            Text("Top_Doctor".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.search,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width/26),
            Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
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
                          color:themedata.isdark ? Medicacolor.darkblack :  Medicacolor.white,
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
                                      Image.asset(MedicaPngImg.wishlist,height: height/36,color: Medicacolor.primary,),
                                    ],
                                  ),
                                  SizedBox(height: height/86),
                                  Container(
                                    height: height/500,
                                    width: width/1.5,
                                    color:  themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,
                                  ),
                                  SizedBox(height: height/86),
                                  Text("Cardilogists  |  Alka Hospital",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                  SizedBox(height: height/76),
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
}
