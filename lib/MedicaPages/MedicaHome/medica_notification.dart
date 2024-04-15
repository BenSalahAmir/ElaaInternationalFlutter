import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaNotification extends StatefulWidget {
  const MedicaNotification({Key? key}) : super(key: key);

  @override
  State<MedicaNotification> createState() => _MedicaNotificationState();
}

class _MedicaNotificationState extends State<MedicaNotification> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> notification = ["Appointment Cancelled!","Schedule Changed","Appointment Success!","New Services Available!","Credit Card Connected!"];
  List<String> notificationimg = [MedicaPngImg.closebutton,MedicaPngImg.activecalender,MedicaPngImg.activecalender,MedicaPngImg.promo,MedicaPngImg.walletfill];
  List<Color> lightcolor = [Medicacolor.lightred,Medicacolor.lightgreen,Medicacolor.lightprimary,Medicacolor.lightyellow,Medicacolor.lightprimary];
  List<Color> color = [Medicacolor.red,Medicacolor.green,Medicacolor.primary,Medicacolor.yellow,Medicacolor.primary];
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
            Text("Notification".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              ListView.separated(
                itemCount: notification.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: height/13,
                              width: height/13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: lightcolor[index]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Image.asset(notificationimg[index],height: height/56,color: color[index],),
                              ),
                            ),
                            SizedBox(width: width/26,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: width/1.8,
                                        child: Text(notification[index],style: urbanistSemiBold.copyWith(fontSize: 19 ),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                  ],
                                ),
                                SizedBox(height: height/80,),
                                Text("20 Dec, 2022 | 20:49 PM",style: urbanistRegular.copyWith(fontSize: 14 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            const Spacer(),
                            if(index == 0 || index == 1)...[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Medicacolor.primary
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/110),
                                  child: Text("New".tr,style: urbanistSemiBold.copyWith(fontSize: 10,color: Medicacolor.white)),
                                ),
                              ),
                            ],

                          ],
                        ),
                        SizedBox(height: height/40,),
                        Text("You have successfully canceled your appoinment with Dr.alan watson on December 24, 2024, 13:00 p.m. 80% of the funds will be returned to your account.",
                            style: urbanistRegular.copyWith(fontSize: 15,color: Medicacolor.textgray)),

                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return  SizedBox(height: height/46);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
