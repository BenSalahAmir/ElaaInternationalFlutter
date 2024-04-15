import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';

class MedicaArticlesdetail extends StatefulWidget {
  const MedicaArticlesdetail({Key? key}) : super(key: key);

  @override
  State<MedicaArticlesdetail> createState() => _MedicaArticlesdetailState();
}

class _MedicaArticlesdetailState extends State<MedicaArticlesdetail> {
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(MedicaPngImg.save,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width/26,),
            Image.asset(MedicaPngImg.send,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width/26,),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(MedicaPngImg.corona,width: width/1,fit: BoxFit.fitWidth,),
              ),
              SizedBox(height: height/36,),
              Text("COVID-19 was a top cause of Death in 2020 and 2021,Even for younger people".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/36,),
              Row(
                children: [
                  Text(
                    "Dec 22,2022".tr,
                    style: urbanistMedium.copyWith(
                        fontSize: 12,
                        color: Medicacolor.textgray),
                  ),
                  SizedBox(width: width/26,),
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
              ),
              SizedBox(height: height/66,),
              Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
              SizedBox(height: height/66,),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.".tr,
                style: urbanistSemiBold.copyWith(
                    fontSize: 14,
                    ),
              ),
              SizedBox(height: height/46,),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.".tr,
                style: urbanistSemiBold.copyWith(
                    fontSize: 14,
                   ),
              ),
              SizedBox(height: height/46,),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.".tr,
                style: urbanistSemiBold.copyWith(
                    fontSize: 14,
                    ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
