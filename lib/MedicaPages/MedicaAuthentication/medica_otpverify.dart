import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_newpassword.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaVerifyotp extends StatefulWidget {
  const MedicaVerifyotp({Key? key}) : super(key: key);

  @override
  State<MedicaVerifyotp> createState() => _MedicaVerifyotpState();
}

class _MedicaVerifyotpState extends State<MedicaVerifyotp> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  @override
  void initState()
  {
    super.initState();
    startTimer();
  }

  bool isresend=false;
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 2);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        isresend = true;
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(2));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("OTP_Code_Verification".tr,style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text("Code has been send to +1 111 ******99",style: urbanistMedium.copyWith(fontSize: 18)),
            SizedBox(height: height/16),
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
                    onSaved: (pin2){},
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
                    onSaved: (pin3){},
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: themedata.isdark ? Medicacolor.darkblack :Medicacolor.lightgrey)
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
              ],
            ),
            SizedBox(height: height/16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Resend_code_in".tr,style: urbanistMedium.copyWith(fontSize: 18)),
                Text("${minutes.toString()}:${seconds.toString()}".tr,style: urbanistMedium.copyWith(fontSize: 18,color: Medicacolor.primary)),
                Text(" s".tr,style: urbanistMedium.copyWith(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
        child:  InkWell(
          splashColor:Medicacolor.transparent,
          highlightColor:Medicacolor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MedicaNewPassword();
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
              child: Text("Verify".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
