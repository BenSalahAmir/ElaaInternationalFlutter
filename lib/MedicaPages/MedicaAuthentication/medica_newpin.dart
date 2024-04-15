import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_fingerprint.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaNewPin extends StatefulWidget {
  final String? type;
  const MedicaNewPin({super.key,required this.type});

  @override
  State<MedicaNewPin> createState() => _MedicaNewPinState();
}

class _MedicaNewPinState extends State<MedicaNewPin> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.type == "1" ? "Create_New_PIN".tr : "Enter_Your_PIN".tr,style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
        child: Column(
          children: [
            SizedBox(height: height/16),
            Text(widget.type == "1" ? "Add_a_PIN_number_to_make_your_account_more_secure".tr :
              "Enter_your_PIN_to_confrim_appointment".tr,
              style: urbanistRegular.copyWith(fontSize: 18),textAlign: TextAlign.center,),
            SizedBox(height: height/10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height/11,
                  width: height/11,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin1){},
                    obscureText: true,
                    obscuringCharacter: themedata.isdark ? "⚪" : "⚫",
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.lightgrey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Medicacolor.primary)
                      ),
                      fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                      filled: true,
                    ),
                    style: urbanistSemiBold.copyWith(fontSize: 24),
                    cursorColor: Medicacolor.textgray,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: height/11,
                  width: height/11,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin2){},
                    obscureText: true,
                    obscuringCharacter: themedata.isdark ? "⚪" : "⚫",
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.lightgrey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Medicacolor.primary)
                      ),
                      fillColor: themedata.isdark ? Medicacolor.darkblack :  Medicacolor.container,
                      filled: true,
                    ),
                    style: urbanistSemiBold.copyWith(fontSize: 24),
                    cursorColor: Medicacolor.textgray,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: height/11,
                  width: height/11,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin3){},
                    obscureText: true,
                    obscuringCharacter: themedata.isdark ? "⚪" : "⚫",
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.lightgrey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Medicacolor.primary)
                      ),
                      fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                      filled: true,
                    ),
                    style: urbanistSemiBold.copyWith(fontSize: 24),
                    cursorColor: Medicacolor.textgray,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: height/11,
                  width: height/11,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin4){},
                    obscureText: true,
                    obscuringCharacter: themedata.isdark ? "⚪" : "⚫",
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(color: themedata.isdark ? Medicacolor.darkblack :Medicacolor.lightgrey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Medicacolor.primary)
                      ),
                      fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                      filled: true,
                    ),
                    style: urbanistSemiBold.copyWith(fontSize: 24),
                    cursorColor: Medicacolor.textgray,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              splashColor: Medicacolor.transparent,
              highlightColor: Medicacolor.transparent,
              onTap: () {
                if(widget.type == "1"){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const MedicaFingerprint();
                    },
                  ));
                }else{
                  paymentsuccess();
                }
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
    );
  }
  paymentsuccess() async {
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
                  Image.asset(MedicaPngImg.booksuccess,height: height/6,fit: BoxFit.fill),
                  SizedBox(height: height/36),
                  Text("Congratulations".tr,style: urbanistBold.copyWith
                    (fontSize: 24,color: Medicacolor.primary),textAlign: TextAlign.center,),
                  SizedBox(height:height/86),
                  Text("Appointment_successfully_booked_You_will_receive_a_receive_a_notification_and_the_doctor_you_selected_will_contact_you".tr,
                      style: urbanistRegular.copyWith(fontSize: 16),textAlign: TextAlign.center),
                  SizedBox(height: height/36),
                  InkWell(
                    splashColor:Medicacolor.transparent,
                    highlightColor:Medicacolor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const MedicaDashboard();
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
                        child: Text("View_Appointment".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height/46),
                  InkWell(
                    splashColor:Medicacolor.transparent,
                    highlightColor:Medicacolor.transparent,
                    onTap: () {
                      paymentfailed();
                    },
                    child: Container(
                      height: height/15,
                      width: width/1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: themedata.isdark ? Medicacolor.lblack : Medicacolor.lightprimary,
                      ),
                      child: Center(
                        child: Text("Cancel".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.primary)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        context: context);
  }

  paymentfailed() async {
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
                  Image.asset(MedicaPngImg.failedimg,height: height/6,fit: BoxFit.fill),
                  SizedBox(height: height/36),
                  Text("Oops_Failed".tr,style: urbanistBold.copyWith
                    (fontSize: 24,color: Medicacolor.red),textAlign: TextAlign.center,),
                  SizedBox(height:height/86),
                  Text("Appintment_failed_Please_check_your_internet_connection_then_try_again".tr,
                      style: urbanistRegular.copyWith(fontSize: 16),textAlign: TextAlign.center),
                  SizedBox(height: height/36),
                  InkWell(
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
                        child: Text("Try_Again".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height/46),
                  InkWell(
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
                        color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.lightprimary,
                      ),
                      child: Center(
                        child: Text("Cancel".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.primary)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        context: context);
  }
}
