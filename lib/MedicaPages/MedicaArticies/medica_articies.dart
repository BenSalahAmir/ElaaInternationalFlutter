import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'medica_allarticies.dart';
import 'medica_articlesdetail.dart';
import 'medica_mybookmark.dart';


class MedicaArticies extends StatefulWidget {
  const MedicaArticies({Key? key}) : super(key: key);

  @override
  State<MedicaArticies> createState() => _MedicaArticiesState();
}

class _MedicaArticiesState extends State<MedicaArticies> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List trending = ["Adding salt to your food May Increase Risk of pre","COVID-19 Reinfection in May Increase Risk of pre"];
  List text = ["Newest","Health","Covid-19","Lifestyle"];
  int selected1 = 0;
  List title2 = ["COVID-19 was a top cause of Death in 2020 and 2021,Even for younger people","study finds Being Hangry is a real thing.","why childhood obesity rates are rising and what we can do."];
  List img2 = [
    MedicaPngImg.a1,
    MedicaPngImg.a2,
    MedicaPngImg.a3,
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/1,
        leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: width/26),
            child: Row(
              children: [
                SvgPicture.asset(MedicaSvgImg.logo,height: height/26),
                SizedBox(width: width/16),
                Text("Articles".tr,style: urbanistBold.copyWith(fontSize: 24)),
                const Spacer(),
                Image.asset(MedicaPngImg.search,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
                SizedBox(width: width/26,),
                InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const MedicaMybookmark();
                      },));
                    },
                    child: Image.asset(MedicaPngImg.save,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black)),
              ],
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Trending".tr,style: urbanistBold.copyWith(fontSize: 20)),
                  const Spacer(),
                  Text("See_All".tr,style: urbanistBold.copyWith(fontSize: 14,color: Medicacolor.primary)),
                ],
              ),
              SizedBox(height: height/36,),
              SizedBox(
                height: height/3.5,
                child: ListView.separated(
                  itemCount: trending.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: width/1.75,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(MedicaPngImg.trending1,width: width/1.75,height: height/5.5,fit: BoxFit.fill,),
                            ),
                            SizedBox(height: height/46,),
                            SizedBox(
                                width: width/1.8,
                                child: Text(trending[index],style: urbanistSemiBold.copyWith(fontSize: 18),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(width: width/26,);
                    },
                    ),
              ),
              Row(
                children: [
                  Text("Articals".tr,style: urbanistBold.copyWith(fontSize: 20)),
                  const Spacer(),
                  InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const MedicaAllarticies();
                        },));
                      },
                      child: Text("See_All".tr,style: urbanistBold.copyWith(fontSize: 14,color: Medicacolor.primary))),
                ],
              ),
              SizedBox(height: height/46,),
              SizedBox(
                height: height / 20,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Medicacolor.transparent,
                        highlightColor: Medicacolor.transparent,
                        onTap: () {
                          setState(() {
                            selected1 = index;
                          });
                        },
                        child: Container(
                          height: height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all( color: selected1 == index
                                  ? Medicacolor.transparent
                                  : Medicacolor.primary),
                              color: selected1 == index
                                  ? Medicacolor.primary
                                  : Medicacolor.transparent),
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width / 16),
                            child: Center(
                              child: Text(text[index],
                                  style: urbanistMedium.copyWith(
                                      fontSize: 16,
                                      color: selected1 == index
                                          ? Medicacolor.white
                                          : Medicacolor.primary)),
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
                    itemCount: text.length),
              ),
              SizedBox(height: height/36,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Medicacolor.transparent,
                      highlightColor: Medicacolor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const MedicaArticlesdetail();
                        },));
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              img2[index],
                              height: height / 7.3,
                              width: height / 7.3,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: width / 36,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dec 22,2022".tr,
                                style: urbanistMedium.copyWith(
                                    fontSize: 10,
                                    color: Medicacolor.textgray),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 1.6,
                                    child: Text(
                                      title2[index],
                                      style: urbanistSemiBold.copyWith(
                                        fontSize: 16,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Medicacolor.lightprimary),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 120),
                                  child: Text(
                                    "Covid-19".tr,
                                    style: urbanistSemiBold.copyWith(
                                        fontSize: 10,
                                        color: Medicacolor.primary),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: height / 56,
                    );
                  },
                  itemCount: img2.length)
            ],
          ),
        ),
      ),
    );
  }
}
