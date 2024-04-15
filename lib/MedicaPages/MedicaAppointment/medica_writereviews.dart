import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaWriteReviews extends StatefulWidget {
  const MedicaWriteReviews({Key? key}) : super(key: key);

  @override
  State<MedicaWriteReviews> createState() => _MedicaWriteReviewsState();
}

class _MedicaWriteReviewsState extends State<MedicaWriteReviews> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  String friend = "yes";
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
            Text("Write_a_Review".tr,style: urbanistBold.copyWith(fontSize: 22 )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Medicacolor.transparent,
                backgroundImage: AssetImage(MedicaPngImg.doctor5),
              ),
              SizedBox(height: height/96),
              Text('How was your experience\nwith Dr.Drake Boeson?',
                style: urbanistBold.copyWith(fontSize: 18),textAlign: TextAlign.center,),
              SizedBox(height: height/46),
              Image.asset(MedicaPngImg.rating4,color: Medicacolor.primary,height: height/20),
              SizedBox(height: height/76),
              Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
              SizedBox(height: height/76),
              Row(
                children: [
                  Text("Write_Your_Review".tr,style: urbanistBold.copyWith(fontSize: 18)),
                ],
              ),
              SizedBox(height: height/96),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.👍👍",
                      style: urbanistMedium.copyWith(fontSize: 14)),
                ),
              ),
              SizedBox(height: height/36),
              Text("Would you recommend Dr.Drake Boeson to your friends?".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/96),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width/2.3,
                    child: RadioListTile(
                      activeColor: Medicacolor.primary,
                      title: Text("Yes".tr,style: urbanistSemiBold.copyWith(fontSize: 15),),
                      value: "yes",
                      groupValue: friend,
                      onChanged: (value){
                        setState(() {
                          friend = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: width/2.3,
                    child: RadioListTile(
                      activeColor: Medicacolor.primary,
                      title: Text("No".tr,style: urbanistSemiBold.copyWith(fontSize: 15)),
                      value: "no",
                      groupValue: friend,
                      onChanged: (value){
                        setState(() {
                          friend = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
        child:   Row(
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
                child: Center(child: Text("Cancel".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary),)),
              ),
            ),
            InkWell(
              splashColor: Medicacolor.transparent,
              highlightColor: Medicacolor.transparent,
              onTap: () {
                reviewsuccess();
              },
              child: Container(
                height: height/16,
                width: width/2.2,
                decoration: BoxDecoration(
                  color: Medicacolor.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Text("Submit".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
              ),
            ),
          ],
        )
      ),
    );
  }
   reviewsuccess()  async {
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
                  Image.asset(MedicaPngImg.reviewsuccess,height: height/6,fit: BoxFit.fill),
                  SizedBox(height: height/36),
                  Text("Review_Successful".tr,style: urbanistBold.copyWith
                    (fontSize: 24,color: Medicacolor.primary),textAlign: TextAlign.center,),
                  SizedBox(height:height/86),
                  Text("You_review_has_been_successfully_submitted_thank_you_very_much".tr,
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
