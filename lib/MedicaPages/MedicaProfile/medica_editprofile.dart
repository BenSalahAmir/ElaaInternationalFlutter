import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaEditprofile extends StatefulWidget {
  const MedicaEditprofile({Key? key}) : super(key: key);

  @override
  State<MedicaEditprofile> createState() => _MedicaEditprofileState();
}

class _MedicaEditprofileState extends State<MedicaEditprofile> {
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
          children: [
            Text("Edit_Profile".tr,style: urbanistBold.copyWith(fontSize: 22 )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
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
              SizedBox(height: height/46,),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Nickname".tr,
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
              SizedBox(height: height/46,),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "DOB".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  suffixIcon:Icon(Icons.calendar_month_rounded,size: height/36,color: Medicacolor.textgray,),
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
              SizedBox(height: height/46,),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Email".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  suffixIcon:Icon(Icons.email_outlined,size: height/36,color: Medicacolor.textgray,),
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
              SizedBox(height: height/46,),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Select_country".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  suffixIcon:Icon(Icons.arrow_drop_down_sharp,size: height/36,color: Medicacolor.textgray,),
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
              SizedBox(height: height/46,),
              IntlPhoneField(
                flagsButtonPadding: const EdgeInsets.all(8),
                dropdownIconPosition: IconPosition.trailing,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                keyboardType: TextInputType.number,
                disableLengthCheck: true,
                dropdownTextStyle: urbanistSemiBold.copyWith(fontSize: 16,color: themedata.isdark?Medicacolor.white:Medicacolor.textgray,),
                decoration: InputDecoration(
                  hintText: "00000000000",
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
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
              SizedBox(height: height/46,),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Gender".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  suffixIcon:Icon(Icons.arrow_drop_down_sharp,size: height/36,color: Medicacolor.textgray,),
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
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
        child: InkWell(
          splashColor:Medicacolor.transparent,
          highlightColor:Medicacolor.transparent,
          onTap: () {

          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Medicacolor.primary,
            ),
            child: Center(
              child: Text("Save".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
