import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_bookpayments.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaPatientDetail extends StatefulWidget {
  const MedicaPatientDetail({Key? key}) : super(key: key);

  @override
  State<MedicaPatientDetail> createState() => _MedicaPatientDetailState();
}

class _MedicaPatientDetailState extends State<MedicaPatientDetail> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Patient_Details".tr,style: urbanistBold.copyWith(fontSize: 24)),],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Full_Name".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/66),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Full_Name".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  //  prefixIcon:Icon(Icons.search_rounded,size: height/36,color: Medicacolor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Medicacolor.primary)
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Text("Gender".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/66),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Gender".tr,
                  suffixIcon:Icon(Icons.arrow_drop_down_rounded,size: height/26),
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  //  prefixIcon:Icon(Icons.search_rounded,size: height/36,color: Medicacolor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Medicacolor.primary)
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Text("Your_Age".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/66),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Your_Age".tr,
                  suffixIcon:Icon(Icons.arrow_drop_down_rounded,size: height/26),
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  //  prefixIcon:Icon(Icons.search_rounded,size: height/36,color: Medicacolor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Medicacolor.primary)
                  ),
                ),
              ),
              SizedBox(height: height/36),
              Text("Write_Your_Problem".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/66),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                maxLines: 7 ,
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Write_Your_Problem".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  //  prefixIcon:Icon(Icons.search_rounded,size: height/36,color: Medicacolor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Medicacolor.primary)
                  ),
                ),
              ),
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
              return const MedicaBookPayment();
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
