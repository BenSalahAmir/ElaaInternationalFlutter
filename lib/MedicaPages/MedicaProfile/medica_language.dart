import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaLanguage extends StatefulWidget {
  const MedicaLanguage({Key? key}) : super(key: key);

  @override
  State<MedicaLanguage> createState() => _MedicaLanguageState();
}

class _MedicaLanguageState extends State<MedicaLanguage> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  int selectsuggest = 0;
  int selectlanguage = 0;
  List<String> suggest = ["English (US)","English (UK)"];
  List<String> language = ["Mandarin","Hindi","Spanish","French","Arabic","Bengali","Russian","Indonesia"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Language".tr,style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Suggested".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/36),
              ListView.separated(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Medicacolor.transparent,
                      highlightColor: Medicacolor.transparent,
                      onTap: () {
                        setState(() {
                          selectsuggest = index;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(suggest[index].toString(),style: urbanistSemiBold.copyWith(fontSize: 18)),
                          if(selectsuggest == index)...[
                            const Icon(Icons.radio_button_checked,size: 20,color: Medicacolor.primary),
                          ]else...[
                            const Icon(Icons.radio_button_off_outlined,size: 20,color: Medicacolor.primary),
                          ]
                        ],
                      ),
                    );
                  }, separatorBuilder: (context, index) {
                     return SizedBox(height: height/36);
              }, itemCount: suggest.length),
              SizedBox(height: height/86),
              Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
              SizedBox(height: height/86),
              Text("Language".tr,style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height/36),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Medicacolor.transparent,
                      highlightColor: Medicacolor.transparent,
                      onTap: () {
                        setState(() {
                          selectlanguage = index;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(language[index].toString(),style: urbanistSemiBold.copyWith(fontSize: 18)),
                          if(selectlanguage == index)...[
                            const Icon(Icons.radio_button_checked,size: 20,color: Medicacolor.primary),
                          ]else...[
                            const Icon(Icons.radio_button_off_outlined,size: 20,color: Medicacolor.primary),
                          ]
                        ],
                      ),
                    );
                  }, separatorBuilder: (context, index) {
                return SizedBox(height: height/36);
              }, itemCount: language.length),
            ],
          ),
        ),
      ),
    );
  }
}
