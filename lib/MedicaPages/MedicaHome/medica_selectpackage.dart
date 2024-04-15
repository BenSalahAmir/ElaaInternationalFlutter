import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_patientdetail.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaSelectPackage extends StatefulWidget {
  const MedicaSelectPackage({Key? key}) : super(key: key);

  @override
  State<MedicaSelectPackage> createState() => _MedicaSelectPackageState();
}

class _MedicaSelectPackageState extends State<MedicaSelectPackage> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  int select = 0;
  List<String> packagename = ["Messaging","Voice Call","Video Call"];
  List<String> packageimg = [MedicaPngImg.msg,MedicaPngImg.phone,MedicaPngImg.video];
  List<String> subtital = ["Chat messages with doctor","Voice call with doctor","Video call with doctor"];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select_Package".tr,style: urbanistBold.copyWith(fontSize: 24)),],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select_Duration".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/46),
              Container(
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
                     const Icon(Icons.access_time_filled_rounded,size: 20),
                      SizedBox(width: width/26),
                      Text("30 minutes".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down_rounded,size: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Text("Select_Package".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/36),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: packagename.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                     setState(() {
                       select = index;
                     });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: height/36),
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
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Medicacolor.lightprimary,
                            child: Image.asset(packageimg[index].toString(),height: height/32,color: Medicacolor.primary,),
                          ),
                            SizedBox(
                              width: width/2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(packagename[index].toString(),style: urbanistBold.copyWith(fontSize: 17)),
                                  SizedBox(height: height/150),
                                  Text(subtital[index].toString(),style: urbanistMedium.copyWith(fontSize: 13,color: Medicacolor.textgray)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$40",style: urbanistBold.copyWith(fontSize: 17,color: Medicacolor.primary)),
                                SizedBox(height: height/150),
                                Text("30 min",style: urbanistMedium.copyWith(fontSize: 13,color: Medicacolor.textgray)),
                              ],
                            ),
                            if(select == index)...[
                              const Icon(Icons.radio_button_checked,size: 22,color: Medicacolor.primary),
                            ]else...[
                              const Icon(Icons.radio_button_off_outlined,size: 22,color: Medicacolor.primary),
                            ]
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/96),
        child: InkWell(
          splashColor: Medicacolor.transparent,
          highlightColor: Medicacolor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MedicaPatientDetail();
            },));
          },
          child: Container(
            height: height/16,
            width: width/1,
            decoration: BoxDecoration(
              color: Medicacolor.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text("Next".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
          ),
        ),
      ),
    );
  }
}
