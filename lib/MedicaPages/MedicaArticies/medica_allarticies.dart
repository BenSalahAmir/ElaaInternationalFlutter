import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';

class MedicaAllarticies extends StatefulWidget {
  const MedicaAllarticies({Key? key}) : super(key: key);

  @override
  State<MedicaAllarticies> createState() => _MedicaAllarticiesState();
}

class _MedicaAllarticiesState extends State<MedicaAllarticies> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List text = ["Newest","Health","Covid-19","Lifestyle"];
  int selected1 = 0;
  List title2 = [
    "COVID-19 was a top cause of Death in 2020 and 2021,Even for younger people",
    "study finds Being Hangry is a real thing.",
    "why childhood obesity rates are rising and what we can do.",
    "Depression Treatment:How Genetic Testing can help find the right medication",
    "Drinking Alone as a Teen may foreshadow future alcohol problems",
    "COVID-19 was a top cause of Death in 2020 and 2021,Even for younger people",
    "study finds Being Hangry is a real thing.",
  ];
  List img2 = [
    MedicaPngImg.a1,
    MedicaPngImg.a2,
    MedicaPngImg.a3,
    MedicaPngImg.a4,
    MedicaPngImg.a5,
    MedicaPngImg.a1,
    MedicaPngImg.a2,
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
            Text("Articles".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.search,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width/26,),
            Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
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
                    return Row(
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
