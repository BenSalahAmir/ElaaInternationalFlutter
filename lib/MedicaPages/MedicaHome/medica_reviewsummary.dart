import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_newpin.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaReviewsummary extends StatefulWidget {
  const MedicaReviewsummary({Key? key}) : super(key: key);

  @override
  State<MedicaReviewsummary> createState() => _MedicaReviewsummaryState();
}

class _MedicaReviewsummaryState extends State<MedicaReviewsummary> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Review_Summary".tr,style: urbanistBold.copyWith(fontSize: 24)),],
        ),
      ),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:themedata.isdark ? Medicacolor.darkblack :  Medicacolor.white,
                    boxShadow:  [
                      BoxShadow(
                        blurRadius: 5,
                        color:themedata.isdark ? Medicacolor.transparent :  Medicacolor.lightgrey,
                      )]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(MedicaPngImg.doctor5,height: height/8,width: height/8,fit: BoxFit.fitHeight,),
                      ),
                      SizedBox(
                        width: width/1.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dr.Jenny Watson",style: urbanistBold.copyWith(fontSize: 18)),
                            SizedBox(height: height/86),
                            Container(
                              height: height/500,
                              width: width/1.5,
                              color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,
                            ),
                            SizedBox(height: height/86),
                            Text("Immunologists",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                            SizedBox(height: height/76),
                            Text("Christ Hospital in London,UK",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Container(
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
                  padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date_Hour".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          Text("Dec 23, 2024 | 10:00 AM".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                        ],
                      ),
                      SizedBox(height:height/36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Package".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          Text("Messaging".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                        ],
                      ),
                      SizedBox(height:height/96),
                      Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                      SizedBox(height:height/76),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Duration".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          Text("30 minutes".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Container(
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
                  padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Amount".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          Text("\$20".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                        ],
                      ),
                      SizedBox(height:height/36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Duration (30 mins)".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          Text("1 x \$20".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                        ],
                      ),
                      SizedBox(height:height/96),
                      Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                      SizedBox(height:height/76),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          Text("\$20".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Container(
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
                  padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
                  child: Row(
                    children: [
                      Image.asset(MedicaPngImg.mastercard,height: height/32),
                      SizedBox(width: width/26),
                      Text("•••• •••• •••• •••• 4679".tr,style: urbanistBold.copyWith(fontSize: 18)),
                      const Spacer(),
                      Text("Change".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
        child:  InkWell(
          splashColor:Medicacolor.transparent,
          highlightColor:Medicacolor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MedicaNewPin(type : "2");
            },));
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Medicacolor.primary,
            ),
            child: Center(
              child: Text("Next".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
