import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaReviews extends StatefulWidget {
  const MedicaReviews({Key? key}) : super(key: key);

  @override
  State<MedicaReviews> createState() => _MedicaReviewsState();
}

class _MedicaReviewsState extends State<MedicaReviews> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int rating = 0;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> ratingname = ["All","5","4","3","2","1"];
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
            Text("4.8 (4.942 reviews)".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
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
              SizedBox(
                height: height / 25,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Medicacolor.transparent,
                        highlightColor: Medicacolor.transparent,
                        onTap: () {
                          setState(() {
                            rating = index;
                          });
                        },
                        child: Container(
                          height: height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all( color: rating == index
                                  ? Medicacolor.transparent
                                  : Medicacolor.primary),
                              color: rating == index
                                  ? Medicacolor.primary
                                  : Medicacolor.transparent),
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width / 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star_rate_rounded,size: 15,color: rating == index ? Medicacolor.white : Medicacolor.primary),
                                SizedBox(width: width/46),
                                Text(ratingname[index],
                                    style: urbanistMedium.copyWith(
                                        fontSize: 16,
                                        color: rating == index
                                            ? Medicacolor.white
                                            : Medicacolor.primary)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: width / 36,
                      );
                    },
                    itemCount: ratingname.length),
              ),
              SizedBox(height: height/26),
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
    );
  }
}
