import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHistory/AddReviewPage.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_doctordetails.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaSearch extends StatefulWidget {
  const MedicaSearch({Key? key}) : super(key: key);

  @override
  State<MedicaSearch> createState() => _MedicaSearchState();
}

class _MedicaSearchState extends State<MedicaSearch> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int selected = 0;
  int speciality = 0;
  int rating = 0;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> doctorname = ["Dr.Travis Westaby","Dr.Nathaniel Valle","Dr.Beckett Calger","Dr.Jada Srnsky","Dr.Bernard Bliss"];
  List<String> doctorimg = [MedicaPngImg.doctor2,MedicaPngImg.doctor1,MedicaPngImg.doctor3,MedicaPngImg.doctor5,MedicaPngImg.doctor4];
  List<String> category = ["All","General","Dentist","Nutritionist","ophthalmology","Pediatric","Radiology"];
  List<String> ratingname = ["All","5","4","3","2","1"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/10,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width/1.4,
              height: height/15,
              child: TextFormField(
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(MedicaPngImg.search,height: height/46,),
                    ),
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Search".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            InkWell(
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                onTap: () {
                  filter();
                },
                child: Image.asset(MedicaPngImg.filter,height: height/56,color: Medicacolor.primary)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
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
                            selected = index;
                          });
                        },
                        child: Container(
                          height: height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all( color: selected == index
                                  ? Medicacolor.transparent
                                  : Medicacolor.primary),
                              color: selected == index
                                  ? Medicacolor.primary
                                  : Medicacolor.transparent),
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width / 16),
                            child: Center(
                              child: Text(category[index],
                                  style: urbanistMedium.copyWith(
                                      fontSize: 16,
                                      color: selected == index
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
                    itemCount: category.length),
              ),
              SizedBox(height: height/36),
              Row(
                children: [
                  Text("5 Found",style: urbanistBold.copyWith(fontSize: 20)),
                  const Spacer(),
                  Text("Default".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary)),
                  SizedBox(width: width/46),
                  Image.asset(MedicaPngImg.swap,height: height/56,color: Medicacolor.primary),
                ],
              ),
              SizedBox(height: height/36),
              // SizedBox(height: height/10),
              // Image.asset(MedicaPngImg.notfound),
              // SizedBox(height: height/36),
              // Text("Not_Found".tr,style: urbanistBold.copyWith(fontSize: 20)),
              // SizedBox(height: height/46),
              // Text("Sorry_the_keyword_you_entered_cannot_be_found_Please_check_again_or_search_with_another_keyword".tr,
              //     style: urbanistMedium.copyWith(fontSize: 14),textAlign: TextAlign.center,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: doctorname.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const AddReviewPage();
                      },));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: height/36),
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
                              child: Image.asset(doctorimg[index].toString(),height: height/8,width: height/8,fit: BoxFit.fill,),
                            ),
                            SizedBox(
                              width: width/1.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(doctorname[index].toString(),style: urbanistBold.copyWith(fontSize: 18)),
                                      Image.asset(MedicaPngImg.wishlist,height: height/36,color: Medicacolor.primary,),
                                    ],
                                  ),
                                  SizedBox(height: height/86),
                                  Container(
                                    height: height/500,
                                    width: width/1.5,
                                    color:  themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,
                                  ),
                                  SizedBox(height: height/86),
                                  Text("Cardilogists  |  Alka Hospital",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                  SizedBox(height: height/76),
                                  Row(
                                    children: [
                                      const Icon(Icons.star_rate_rounded,size: 15,color: Medicacolor.primary),
                                      SizedBox(width: width/96),
                                      Text("4.3 (5.376 reviews)",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },)
            ],
          ),
        ),
      ),
    );
  }
  filter() {
    showModalBottomSheet(
        backgroundColor: Medicacolor.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  decoration: BoxDecoration(
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  ),
                  height: height /2.3,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text("Filter".tr,style: urbanistBold.copyWith(fontSize: 20))),
                        SizedBox(height: height/96),
                        Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                        SizedBox(height: height/76),
                        Text("Speciality".tr,style: urbanistBold.copyWith(fontSize: 16)),
                        SizedBox(height: height/46),
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
                                      speciality = index;
                                    });
                                  },
                                  child: Container(
                                    height: height / 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all( color: speciality == index
                                            ? Medicacolor.transparent
                                            : Medicacolor.primary),
                                        color: speciality == index
                                            ? Medicacolor.primary
                                            : Medicacolor.transparent),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: width / 26),
                                      child: Center(
                                        child: Text(category[index],
                                            style: urbanistMedium.copyWith(
                                                fontSize: 16,
                                                color: speciality == index
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
                              itemCount: category.length),
                        ),
                        SizedBox(height: height/46),
                        Text("Rating".tr,style: urbanistBold.copyWith(fontSize: 16)),
                        SizedBox(height: height/46),
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
                        SizedBox(height: height/96),
                        Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                        const Spacer(),
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
                                child: Center(child: Text("Reset".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary),)),
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
                                child: Center(child: Text("Apply".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
