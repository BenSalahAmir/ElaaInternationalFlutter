import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_bookappoinment.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaReschedule extends StatefulWidget {
  const MedicaReschedule({Key? key}) : super(key: key);

  @override
  State<MedicaReschedule> createState() => _MedicaRescheduleState();
}

class _MedicaRescheduleState extends State<MedicaReschedule> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> reason = ["I'm having a schedule clash","I'm not available on schedule","I have a activity that can't be left behind","I don't want to tell","Other"];
  int selectreason = 0;

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
            Text("Reschedule_Appointment".tr,style: urbanistBold.copyWith(fontSize: 22 )),
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
                  color:themedata.isdark ? Medicacolor.darkblack :  Medicacolor.container
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
           Navigator.push(context, MaterialPageRoute(builder: (context) {
             return const  MedicaBookAppoinment(type: "2");
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
              child: Text("Next".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
