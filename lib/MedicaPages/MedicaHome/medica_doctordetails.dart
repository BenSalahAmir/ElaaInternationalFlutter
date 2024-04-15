import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/media_reviews.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_bookappoinment.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaDoctorDetails extends StatefulWidget {
  const MedicaDoctorDetails({Key? key}) : super(key: key);

  @override
  State<MedicaDoctorDetails> createState() => _MedicaDoctorDetailsState();
}

class _MedicaDoctorDetailsState extends State<MedicaDoctorDetails> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> reviewname = ["Charolette Hanlin","Darron Kulikowski","Lauralee Quintero","Aileen Fullbright","Rodolfo Goode"];
  List<String> reviewimg = [MedicaPngImg.photo1,MedicaPngImg.photo2,MedicaPngImg.photo3,MedicaPngImg.photo6,MedicaPngImg.photo7];

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
            Text("Dr.Jenny Watson".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.wishlist,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
            SizedBox(width: width/26),
            Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
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
              SizedBox(height: height/36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(MedicaPngImg.user3,height: height/36,color: Medicacolor.primary),
                      ),
                      SizedBox(height: height/96),
                      Text("5,000+",style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),
                      SizedBox(height: height/96),
                      Text("patients".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(MedicaPngImg.status,height: height/26,color: Medicacolor.primary),
                      ),
                      SizedBox(height: height/96),
                      Text("10+",style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),
                      SizedBox(height: height/96),
                      Text("years_experience".tr,style: urbanistMedium.copyWith(fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Icon(Icons.star_rate_rounded,size: height/26,color: Medicacolor.primary,),
                      ),
                      SizedBox(height: height/96),
                      Text("4.8",style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),
                      SizedBox(height: height/96),
                      Text("rating".tr,style: urbanistMedium.copyWith(fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                  SizedBox(width: width/26),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(MedicaPngImg.msg,height: height/30,color: Medicacolor.primary),
                      ),
                      SizedBox(height: height/96),
                      Text("4,942",style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),
                      SizedBox(height: height/96),
                      Text("reviews".tr,style: urbanistMedium.copyWith(fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height/36),
              Text("About_me".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/96),
              Text("Dr.Jeeny watson is the top most immunologistes specialist in christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultion.",
              style: urbanistMedium.copyWith(fontSize: 14)),
              SizedBox(height: height/36),
              Text("Working_Time".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/96),
              Text("Monday - Friday, 08.00 AM - 20.00 PM",
                  style: urbanistMedium.copyWith(fontSize: 14)),
              SizedBox(height: height/36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Reviews".tr,style: urbanistBold.copyWith(fontSize: 20)),
                  InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const MedicaReviews();
                        },));
                      },
                      child: Text("See_All".tr,style: urbanistBold.copyWith(fontSize: 14,color: Medicacolor.primary))),
                ],
              ),
              SizedBox(height: height/46),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: height/36);
                },
                itemCount: reviewname.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Medicacolor.transparent,
                          child: Image.asset(reviewimg[index].toString()),
                        ),
                        SizedBox(width: width/36),
                        Text(reviewname[index].toString(),style: urbanistBold.copyWith(fontSize: 18)),
                        const Spacer(),
                        Container(
                          height: height / 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color:Medicacolor.primary)
                          ),
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width / 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star_rate_rounded,size: 15,color: Medicacolor.primary),
                                SizedBox(width: width/96),
                                Text("4", style: urbanistMedium.copyWith(
                                        fontSize: 16,
                                        color: Medicacolor.primary)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: width/36),
                        Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black,),
                      ],
                    ),
                    SizedBox(height: height/96),
                    Text("Dr.Jenny is very professional in her work and responsive. I have consulted and my problem is solved.😍😍",style: urbanistMedium.copyWith(fontSize: 14)),
                    SizedBox(height: height/66),
                    Row(
                      children: [
                        Image.asset(MedicaPngImg.wishlist,height: height/42,color: Medicacolor.primary),
                        SizedBox(width: width/96),
                        Text("938",style: urbanistSemiBold.copyWith(fontSize: 12)),
                        SizedBox(width: width/26),
                        Text("6 days ago",style: urbanistSemiBold.copyWith(fontSize: 12,color: Medicacolor.textgray)),
                      ],
                    ),
                  ],
                );
              },)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/96),
        child: InkWell(
          splashColor: Medicacolor.transparent,
          highlightColor: Medicacolor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MedicaBookAppoinment(type: "1");
            },));
          },
          child: Container(
            height: height/16,
            width: width/1,
            decoration: BoxDecoration(
              color: Medicacolor.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text("Book_Appointment".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
          ),
        ),
      ),
    );
  }
}
