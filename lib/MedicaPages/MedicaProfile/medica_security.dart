import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaSecurity extends StatefulWidget {
  const MedicaSecurity({Key? key}) : super(key: key);

  @override
  State<MedicaSecurity> createState() => _MedicaSecurityState();
}

class _MedicaSecurityState extends State<MedicaSecurity> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  bool remember = true;
  bool faceid = false;
  bool bioid = true;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width / 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Security".tr, style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Remember_me".tr,
                      style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            remember = state;
                          });
                        },
                        value: remember),
                  ),
                ],
              ),
              SizedBox(height: height / 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Face_ID".tr,
                      style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            faceid = state;
                          });
                        },
                        value: faceid),
                  ),
                ],
              ),
              SizedBox(height: height / 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Biometric_ID".tr,
                      style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            bioid = state;
                          });
                        },
                        value: bioid),
                  ),
                ],
              ),
              SizedBox(height: height / 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Google_Authenticator".tr,
                      style: urbanistSemiBold.copyWith(fontSize: 18)),
                  const Icon(Icons.arrow_forward_ios_outlined, size: 15),
                ],
              ),
              SizedBox(height: height / 26),
              InkWell(
                splashColor:Medicacolor.transparent,
                highlightColor:Medicacolor.transparent,
                onTap: () {
                },
                child: Container(
                  height: height/15,
                  width: width/1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color:themedata.isdark ? Medicacolor.lblack : Medicacolor.lightprimary,
                  ),
                  child: Center(
                    child: Text("Change_PIN".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color: themedata.isdark ? Medicacolor.white : Medicacolor.primary)),
                  ),
                ),
              ),
              SizedBox(height: height / 46),
              InkWell(
                splashColor:Medicacolor.transparent,
                highlightColor:Medicacolor.transparent,
                onTap: () {
                },
                child: Container(
                  height: height/15,
                  width: width/1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color:themedata.isdark ? Medicacolor.lblack : Medicacolor.lightprimary,
                  ),
                  child: Center(
                    child: Text("Change_Password".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color: themedata.isdark ? Medicacolor.white : Medicacolor.primary)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
