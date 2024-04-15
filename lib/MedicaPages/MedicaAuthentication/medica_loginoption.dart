import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_login.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_register.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaLoginoption extends StatefulWidget {
  const MedicaLoginoption({Key? key}) : super(key: key);

  @override
  State<MedicaLoginoption> createState() => _MedicaLoginoptionState();
}

class _MedicaLoginoptionState extends State<MedicaLoginoption> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Column(
          children: [
            SizedBox(height: height/10,),
            SvgPicture.asset(MedicaSvgImg.loginoption,height: height/4.5,fit: BoxFit.fitHeight,),
            SizedBox(height: height/26,),
            Text("Lets_you_in".tr,style: urbanistBold.copyWith(fontSize: 40)),
            SizedBox(height: height/23,),
            Container(
              height: height/15,
              width: width/1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(MedicaPngImg.facebook,height: height/30,),
                  SizedBox(width: width/36,),
                  Text("Continue_with_Facebook".tr,style: urbanistSemiBold.copyWith(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: height/46,),
            Container(
              height: height/15,
              width: width/1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: themedata.isdark ? Medicacolor.darkblack :  Medicacolor.bggray)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(MedicaPngImg.google,height: height/30,),
                  SizedBox(width: width/36,),
                  Text("Continue_with_Google".tr,style: urbanistSemiBold.copyWith(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: height/46,),
            Container(
              height: height/15,
              width: width/1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(MedicaPngImg.apple,height: height/30,color: themedata.isdark?Medicacolor.white:Medicacolor.black,),
                  SizedBox(width: width/36,),
                  Text("Continue_with_Apple".tr,style: urbanistSemiBold.copyWith(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: height/26,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height / 500,
                    width: width / 2.4,
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray),
                SizedBox(width: width / 56),
                Text(
                  "or".tr,
                  style: urbanistSemiBold.copyWith(
                      fontSize: 15),
                ),
                SizedBox(width: width / 56),
                Container(
                    height: height / 500,
                    width: width / 2.4,
                    color:themedata.isdark ? Medicacolor.darkblack :  Medicacolor.bggray),
              ],
            ),
            SizedBox(height: height/26,),
            const Spacer(),
            InkWell(
              splashColor: Medicacolor.transparent,
              highlightColor: Medicacolor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MedicaLogin();
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
                child: Center(child: Text("Sign_in_with_password".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
              ),
            ),
            SizedBox(height: height/36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont_have_an_account'.tr,
                    style: urbanistRegular.copyWith(
                        fontSize: 14, color: Medicacolor.textgray)),
                SizedBox(width: width/46),
                InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const MedicaRegister();
                      },
                    ));
                  },
                  child: Text('Sign_up'.tr,
                      style: urbanistSemiBold.copyWith(
                          fontSize: 14, color: Medicacolor.primary)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
