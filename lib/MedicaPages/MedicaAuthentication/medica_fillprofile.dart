import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_newpin.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaFillProfile extends StatefulWidget {
  const MedicaFillProfile({Key? key}) : super(key: key);

  @override
  State<MedicaFillProfile> createState() => _MedicaFillProfileState();
}

class _MedicaFillProfileState extends State<MedicaFillProfile> {
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
            Text("Fill_Your_Profile".tr,style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage(MedicaPngImg.photo),
                  ),
                  Positioned(
                    bottom: 0,
                      right: 0,
                      child: Image.asset(MedicaPngImg.editimg,height: height/26,))
                ],
              ),
              SizedBox(height: height/26),
              TextFormField(
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Full_Name".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: height/46),
              TextFormField(
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Nickname".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ), 
              SizedBox(height: height/46),
              TextFormField(
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Image.asset(MedicaPngImg.calender,height: height/46,),
                    ),
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Date_of_Birth".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: height/46),
              TextFormField(
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(MedicaPngImg.mailborder,height: height/46,),
                    ),
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Email".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: height/46),
              IntlPhoneField(
                flagsButtonPadding: const EdgeInsets.all(8),
                dropdownIconPosition: IconPosition.trailing,
                style: urbanistSemiBold.copyWith(fontSize: 16,color: Medicacolor.black,),
                keyboardType: TextInputType.number,
                disableLengthCheck: true,
                decoration:  InputDecoration(
                  hintText: "+1 000 000 000",
                  fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                  filled: true,
                  hintStyle: urbanistRegular,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Medicacolor.primary)
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                },
              ),
              SizedBox(height: height/10),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const MedicaNewPin(type: "1");
                    },
                  ));
                },
                child: Container(
                  height: height/15,
                  width: width/1,
                  decoration: BoxDecoration(
                    color: Medicacolor.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Text("Continue".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
