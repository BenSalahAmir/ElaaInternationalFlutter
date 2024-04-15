import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaFingerprint extends StatefulWidget {
  const MedicaFingerprint({Key? key}) : super(key: key);

  @override
  State<MedicaFingerprint> createState() => _MedicaFingerprintState();
}

class _MedicaFingerprintState extends State<MedicaFingerprint> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());

  goup() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 1));
    navigator.push(MaterialPageRoute(
      builder: (context) {
        return const MedicaDashboard();
      },
    ));
  }

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
            Text("Set_Your_Fingerprint".tr,style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add_a_fingerprint_to_make_your_account_more_secure".tr,
              style: urbanistRegular.copyWith(fontSize: 18),textAlign: TextAlign.center,),
            Image.asset(MedicaPngImg.finger,height: height/4),
            Text("Please_put_your_finger_on_the_fingerprint_scanner_to_get_started".tr,
              style: urbanistRegular.copyWith(fontSize: 18),textAlign: TextAlign.center,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const MedicaFingerprint();
                      },
                    ));
                  },
                  child: Container(
                    height: height/15,
                    width: width/2.3,
                    decoration: BoxDecoration(
                     color: themedata.isdark ? Medicacolor.lblack  : Medicacolor.lightprimary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text("Skip".tr,style: urbanistBold.copyWith(fontSize: 16,color: themedata.isdark ? Medicacolor.white  :Medicacolor.primary),)),
                  ),
                ),
                InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () {
                    alertsuccess();
                    goup();
                  },
                  child: Container(
                    height: height/15,
                    width: width/2.3,
                    decoration: BoxDecoration(
                      color: Medicacolor.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text("Continue".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  alertsuccess() async {
    return await showDialog(
        builder: (context) => AlertDialog(
          backgroundColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(52)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 46, vertical: height / 46),
              child: Column(
                children: [
                  Image.asset(MedicaPngImg.congrats,height: height/6,fit: BoxFit.fill),
                  SizedBox(height: height/36),
                  Text("Congratulations".tr,style: urbanistBold.copyWith
                    (fontSize: 24,color: Medicacolor.primary),textAlign: TextAlign.center,),
                  SizedBox(height:height/86),
                  Text("Your_account_is_ready_to_use_You_will_be_redirected_to_the_Home_page_in_a_few_seconds".tr,
                      style: urbanistRegular.copyWith(fontSize: 16),textAlign: TextAlign.center),
                  SizedBox(height: height/46),
                  Image.asset(MedicaPngImg.circular,height: height/20),
                ],
              ),
            )
          ],
        ),
        context: context);
  }
}
