import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaCancelAppoinment extends StatefulWidget {
  const MedicaCancelAppoinment({Key? key}) : super(key: key);

  @override
  State<MedicaCancelAppoinment> createState() => _MedicaCancelAppoinmentState();
}

class _MedicaCancelAppoinmentState extends State<MedicaCancelAppoinment> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  int selectreason = 7;
  List<String> reason  = [
    "I want to change to anther doctor",
    "I want to change package",
    "I don't want to consult",
    "I have recovered from the disease",
    "I have found a suitable medicine",
    "I just want to cancel",
    "I don't want to tell",
    "Other",
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
          children: [
            Text("Cancel_Appointment".tr,style: urbanistBold.copyWith(fontSize: 22 )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reason_for_Schedule_Change".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/36),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reason.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: height/36);
                },
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      if(selectreason == index)...[
                        const Icon(Icons.radio_button_checked,size: 22,color: Medicacolor.primary),
                      ]else...[
                        const Icon(Icons.radio_button_off_outlined,size: 22,color: Medicacolor.primary),
                      ],
                      SizedBox(width: width/36),
                      Text(reason[index].toString(),style: urbanistMedium.copyWith(fontSize: 16)),
                    ],
                  );
                },),
              SizedBox(height: height/36),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                      style: urbanistMedium.copyWith(fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
        child: InkWell(
          splashColor:Medicacolor.transparent,
          highlightColor:Medicacolor.transparent,
          onTap: () {
            cancelsuccess();
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Medicacolor.primary,
            ),
            child: Center(
              child: Text("Submit".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),
    );
  }
  cancelsuccess() async {
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
                  Image.asset(MedicaPngImg.success,height: height/6,fit: BoxFit.fill),
                  SizedBox(height: height/36),
                  Text("Cancel_Appointment_Success".tr,style: urbanistBold.copyWith
                    (fontSize: 24,color: Medicacolor.primary),textAlign: TextAlign.center,),
                  SizedBox(height:height/86),
                  Text("We_are_very_sad_that_you_have_canceled_your_appointment_we_will_always_improve_our_srvice_to_satisfy_you_in_the_next_appoinrment".tr,
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
                        child: Text("OK".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
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
