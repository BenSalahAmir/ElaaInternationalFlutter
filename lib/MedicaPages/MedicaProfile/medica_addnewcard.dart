import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaAddnewcard extends StatefulWidget {
  const MedicaAddnewcard({Key? key}) : super(key: key);

  @override
  State<MedicaAddnewcard> createState() => _MedicaAddnewcardState();
}

class _MedicaAddnewcardState extends State<MedicaAddnewcard> {
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
            Text("Add_New_Card".tr,style: urbanistBold.copyWith(fontSize: 24)),
            Image.asset(MedicaPngImg.scanner,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(MedicaPngImg.mocard,height: height/4,width: width/1,fit: BoxFit.fill,),
              SizedBox(height: height/96),
              Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
              SizedBox(height: height/96),
              Text("Card_Name".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/96),
              TextFormField(
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Card_Name".tr,
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
              Text("Card_Number".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/96),
              TextFormField(
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Card_Number".tr,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expiry_Date".tr,style: urbanistBold.copyWith(fontSize: 18)),
                      SizedBox(height: height/96),
                      SizedBox(
                        width: width/2.2,
                        child: TextFormField(
                          cursorColor: Medicacolor.lightgrey,
                          style: urbanistSemiBold.copyWith(fontSize: 16),
                          // controller: email,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset(MedicaPngImg.calender,height: height/46),
                            ),
                              fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                              filled: true,
                              hintText: "dd/mm/yyyy".tr,
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
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CVV".tr,style: urbanistBold.copyWith(fontSize: 18)),
                      SizedBox(height: height/96),
                      SizedBox(
                        width: width/2.2,
                        child: TextFormField(
                          cursorColor: Medicacolor.lightgrey,
                          style: urbanistSemiBold.copyWith(fontSize: 16),
                          // controller: email,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                              filled: true,
                              hintText: "CVV".tr,
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
                      ),
                    ],
                  ),
                ],
              )
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
            Navigator.pop(context);
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Medicacolor.primary,
            ),
            child: Center(
              child: Text("Add".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
