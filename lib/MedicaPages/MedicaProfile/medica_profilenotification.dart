import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaProfileNotification extends StatefulWidget {
  const MedicaProfileNotification({Key? key}) : super(key: key);

  @override
  State<MedicaProfileNotification> createState() => _MedicaProfileNotificationState();
}

class _MedicaProfileNotificationState extends State<MedicaProfileNotification> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  bool sound = true;
  bool offer = true;
  bool vibrate = false;
  bool payment = true;
  bool promo = false;
  bool notification = true;
  bool cashback = false;
  bool update = true;
  bool service = false;
  bool tips = false;

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
            Text("Notification".tr,style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("General_Notification".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            notification = state;
                          });
                        },
                        value: notification),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sound".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            sound = state;
                          });
                        },
                        value: sound),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Vibrate".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            vibrate = state;
                          });
                        },
                        value: vibrate),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special_Offers".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            offer = state;
                          });
                        },
                        value: offer),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Promo_Discount".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            promo = state;
                          });
                        },
                        value: promo),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payments".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            payment = state;
                          });
                        },
                        value: payment),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cashback".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            cashback = state;
                          });
                        },
                        value: cashback),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("App_Updates".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            update = state;
                          });
                        },
                        value: update),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New_Service_Available".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            service = state;
                          });
                        },
                        value: service),
                  ),
                ],
              ),
              SizedBox(height: height/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New_Tips_Available".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  SizedBox(
                    height: height / 35,
                    child: Switch(
                        activeColor: Medicacolor.primary,
                        onChanged: (state) {
                          setState(() {
                            tips = state;
                          });
                        },
                        value: tips),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
