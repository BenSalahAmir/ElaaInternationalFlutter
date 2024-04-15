import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_otpverify.dart';


class MedicaForgotPassword extends StatefulWidget {
  const MedicaForgotPassword({Key? key}) : super(key: key);

  @override
  State<MedicaForgotPassword> createState() => _MedicaForgotPasswordState();
}

class _MedicaForgotPasswordState extends State<MedicaForgotPassword> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  int selectindex = 0;
  List name = ["via SMS:","via Email:"];
  List subname = ["+1 111 ******99","and***ley@yourdomain.com"];
  List image = [
    MedicaPngImg.msg,
    MedicaPngImg.mail
  ];

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
            Text("Forgot_Password".tr,style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(MedicaPngImg.forgot,height: height/4,),
            ),
            SizedBox(height: height/36,),
            Text("Select_which_contact_details_should_we_use_to_reset_your_password".tr,style: urbanistRegular.copyWith(fontSize: 14,)),
            SizedBox(height: height/36,),
            ListView.builder(
              itemCount: name.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor:Medicacolor.transparent,
                  highlightColor:Medicacolor.transparent,
                  onTap: () {
                    setState(() {
                      selectindex  = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: height/46),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: selectindex == index ?Medicacolor.primary : themedata.isdark ? Medicacolor.darkblack :Medicacolor.bggray)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.lightprimary,
                            child: Image.asset(image[index],height:height/36,color: Medicacolor.primary,),
                          ),
                          SizedBox(width: width/26),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name[index].toString(),style: urbanistMedium.copyWith(fontSize: 14,color:Medicacolor.textgray)),
                              SizedBox(height: height/96),
                              Text(subname[index].toString(),style: urbanistBold.copyWith(fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },),
            SizedBox(height: height/46),
            InkWell(
              splashColor:Medicacolor.transparent,
              highlightColor:Medicacolor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MedicaVerifyotp();
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
                  child: Text("Continue".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

