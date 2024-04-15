import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_writereviews.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';

class MedicaEndappoinment extends StatefulWidget {
  const MedicaEndappoinment({Key? key}) : super(key: key);

  @override
  State<MedicaEndappoinment> createState() => _MedicaEndappoinmentState();
}

class _MedicaEndappoinmentState extends State<MedicaEndappoinment> {
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
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
        child: Column(
          children: [
            SizedBox(height: height/26,),
            Image.asset(MedicaPngImg.timesuccess,height: height/6,),
            SizedBox(height: height/30,),
            Text("The_consultation_session_has_ended".tr,style: urbanistSemiBold.copyWith(fontSize: 19)),
            SizedBox(height: height/80,),
            Text("Recordings_hase_been_saved_in_activity".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color: Medicacolor.textgray)),
            SizedBox(height: height/66,),
            Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
            SizedBox(height: height/56,),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(MedicaPngImg.doctor5),
            ),
            SizedBox(height: height/56),
            Text("Dr.Jenny Watson",style: urbanistBold.copyWith(fontSize: 20)),
            SizedBox(height: height/96),
            Text("Immunologists",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
            SizedBox(height: height/96),
            Text("Christ Hospital in London,UK",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
            SizedBox(height: height/66,),
            Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height/16,
                    width: width/2.3,
                    decoration: BoxDecoration(
                      color: themedata.isdark ? Medicacolor.lblack  : Medicacolor.lightprimary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text("Back_to_Home".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary),)),
                  ),
                ),
                InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicaWriteReviews(),));
                  },
                  child: Container(
                    height: height/16,
                    width: width/2.2,
                    decoration: BoxDecoration(
                      color: Medicacolor.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text("Leave_a_Review".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
