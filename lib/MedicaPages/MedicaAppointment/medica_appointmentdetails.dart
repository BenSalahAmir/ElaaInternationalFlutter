import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';

import 'medica_endappoinment.dart';

class MedicaAppointmentdetails extends StatefulWidget {
  final String? type;
  const MedicaAppointmentdetails({super.key, required this.type});

  @override
  State<MedicaAppointmentdetails> createState() => _MedicaAppointmentdetailsState();
}

class _MedicaAppointmentdetailsState extends State<MedicaAppointmentdetails> {
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
            Text("My_Appointment".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
                    boxShadow:  [
                      BoxShadow(
                        blurRadius: 5,
                        color:themedata.isdark ? Medicacolor.transparent :  Medicacolor.lightgrey,
                      )]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(MedicaPngImg.doctor5,height: height/8,width: height/8,fit: BoxFit.fitHeight,),
                      ),
                      SizedBox(
                        width: width/1.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dr.Jenny Watson",style: urbanistBold.copyWith(fontSize: 18)),
                            SizedBox(height: height/86),
                            Container(
                              height: height/500,
                              width: width/1.5,
                              color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,
                            ),
                            SizedBox(height: height/86),
                            Text("Immunologists",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                            SizedBox(height: height/76),
                            Text("Christ Hospital in London,UK",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36,),
              Text("Scheduled_Appointment".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/46),
              Text("Today,December 22,2022",style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray)),
              SizedBox(height: height/66,),
              Text("16:00 - 16:30PM(30 minutes)",style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray)),
              SizedBox(height: height/36,),
              Text("Patient_Information".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/46,),
              Row(
                children: [
                  SizedBox(
                      width: width/4,
                      child: Text("Full_name".tr,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                  SizedBox(
                      width: width/1.5,
                      child: Text(": Andrew Ainsley".tr,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                ],
              ),
              SizedBox(height: height/66,),
              Row(
                children: [
                  SizedBox(
                      width: width/4,
                      child: Text("Gender".tr,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                  SizedBox(
                      width: width/1.5,
                      child: Text(": Female".tr,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                ],
              ),
              SizedBox(height: height/66,),
              Row(
                children: [
                  SizedBox(
                      width: width/4,
                      child: Text("Age".tr,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                  SizedBox(
                      width: width/1.5,
                      child: Text(": 27".tr,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                ],
              ),
              SizedBox(height: height/66,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: width/4,
                      child: Text("Problem".tr,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                  SizedBox(
                      width: width/1.5,
                      child: Text(": Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor".tr,maxLines: 3,overflow: TextOverflow.ellipsis,style: urbanistMedium.copyWith(fontSize: 16,color: Medicacolor.textgray,))),
                ],
              ),
              SizedBox(height: height/36,),
              Text("Your_Package".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/46,),
              Container(
                margin: EdgeInsets.only(bottom: height/36),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
                    boxShadow:  [
                      BoxShadow(
                        blurRadius: 5,
                        color: themedata.isdark ? Medicacolor.transparent : Medicacolor.lightgrey,
                      )]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(widget.type == "msg" ? MedicaPngImg.msg : widget.type == "call" ? MedicaPngImg.phone : MedicaPngImg.video,height: height/32,color: Medicacolor.primary,),
                      ),
                      SizedBox(
                        width: width/2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.type == "msg" ? "Messaging".tr : widget.type == "call" ? "Voice_call".tr : "Video_call".tr,style: urbanistBold.copyWith(fontSize: 17)),
                            SizedBox(height: height/150),
                            Text(widget.type == "msg" ? "Chat Messages with doctor".tr : widget.type == "call" ? "Voice call with doctor".tr :  "Video call with doctor",style: urbanistMedium.copyWith(fontSize: 13,color: Medicacolor.textgray)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$40",style: urbanistBold.copyWith(fontSize: 17,color: Medicacolor.primary)),
                          SizedBox(height: height/150),
                          Text("(paid)",style: urbanistMedium.copyWith(fontSize: 13,color: Medicacolor.textgray)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36,),
              InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MedicaEndappoinment();
                  },));
                },
                child: Container(
                  height: height/15,
                  width: width/1,
                  decoration: BoxDecoration(
                    color: Medicacolor.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(widget.type == "msg" ? MedicaPngImg.msg : widget.type == "call" ? MedicaPngImg.phone : MedicaPngImg.video,height: height/46,color: Medicacolor.white,),
                      SizedBox(width: width/36,),
                      Text(widget.type == "msg" ? "Message (Start at 16:00 PM)".tr : widget.type == "call" ? "Voice call (Start at 14:00 PM)".tr : "Video call (Start at 10:00 PM)".tr
                        ,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
