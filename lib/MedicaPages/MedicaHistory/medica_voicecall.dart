import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';

class MedicaVoicecall extends StatefulWidget {
  const MedicaVoicecall({Key? key}) : super(key: key);

  @override
  State<MedicaVoicecall> createState() => _MedicaVoicecallState();
}

class _MedicaVoicecallState extends State<MedicaVoicecall> {
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
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.import,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
                    SizedBox(
                      width: width / 36,
                    ),
                    Text("Download_Audio".tr, style: urbanistSemiBold.copyWith(fontSize: 14)),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(MedicaPngImg.delete,height: height/36,color: Medicacolor.red),
                    SizedBox(
                      width: width / 36,
                    ),
                    Text("Delete_Audio".tr, style: urbanistSemiBold.copyWith(fontSize: 14,color: Medicacolor.red)),
                  ],
                ),
              ),
            ],
            offset: const Offset(5, 50),
            color: themedata.isdark
                ? Medicacolor.lightblack
                : Medicacolor.white,
            constraints: BoxConstraints(
              maxWidth: width / 2,
            ),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            icon: Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            elevation: 2,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
              Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(MedicaPngImg.doctor1,height: height/8,width: height/8,fit: BoxFit.fitHeight,),
              ),
              SizedBox(
                width: width/2.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr.Drake Boeson",style: urbanistBold.copyWith(fontSize: 18)),
                    SizedBox(height: height/86),
                    Text("Voice_call".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                    SizedBox(height: height/76),
                    Text("Today | 14:00 PM",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                  ],
                ),
              ),
              const CircleAvatar(
                radius: 22,
                backgroundColor: Medicacolor.lightprimary,
                child:Icon(Icons.call,size: 20,color: Medicacolor.primary,),
              )
            ],
          ),
        ),
      ),
              SizedBox(height: height/66,),
              Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
              SizedBox(height: height/66,),
              Text("30 minutes of voice calls have been recored",style: urbanistMedium.copyWith(fontSize: 16)),
              SizedBox(height: height/36,),
              Container(
                height: height/15,
                width: width/1,
                decoration: BoxDecoration(
                  color: Medicacolor.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_circle,size: 22,color: Medicacolor.white,),
                    SizedBox(width: width/26,),
                    Text("Play_Audio_Recordings".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),),
                  ],
                ),
              ),
              SizedBox(height: height/36,),
              Image.asset(MedicaPngImg.voicee,width: width/1,fit: BoxFit.fitWidth,),
              SizedBox(height: height/36,),
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
                      child: Center(child: Text("Stop".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary),)),
                    ),
                  ),
                  InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                    },
                    child: Container(
                      height: height/16,
                      width: width/2.2,
                      decoration: BoxDecoration(
                        color: Medicacolor.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: Text("Pause".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
