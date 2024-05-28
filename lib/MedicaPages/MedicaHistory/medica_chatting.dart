import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';

class MedicaChatting extends StatefulWidget {
  /*final String type;
  const JobChatting({super.key,required this.type});*/
  const MedicaChatting({Key? key}) : super(key: key);
  @override
  State<MedicaChatting> createState() => _MedicaChattingState();
}

class _MedicaChattingState extends State<MedicaChatting> {
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
          children: [
            Text("Service Client".tr,style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.search,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width/26,),
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Image.asset(MedicaPngImg.delete,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
                      SizedBox(
                        width: width / 36,
                      ),
                      Text("Effacer le chat", style: urbanistSemiBold.copyWith(fontSize: 14)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Image.asset(MedicaPngImg.import,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
                      SizedBox(
                        width: width / 36,
                      ),
                      Text("Exporter la discussion", style: urbanistSemiBold.copyWith(fontSize: 14)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Image.asset(MedicaPngImg.delete,height: height/36,color: Medicacolor.red),
                      SizedBox(
                        width: width / 36,
                      ),
                      Text("Supprimer le chat", style: urbanistSemiBold.copyWith(fontSize: 14,color: Medicacolor.red)),
                    ],
                  ),
                ),
              ],
              offset: const Offset(5, 50),
              color: themedata.isdark
                  ? Medicacolor.lightblack
                  : Medicacolor.white,
              constraints: BoxConstraints(
                maxWidth: width / 2.5,
              ),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              icon: Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
              elevation: 2,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
              Container(
                height: height/30,
                width: width/6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: themedata.isdark?Medicacolor.lightblack:Medicacolor.container,
                ),
                child: Center(child: Text("Aujourd'hui",style: urbanistSemiBold.copyWith(fontSize: 10,color: Medicacolor.textgray))),
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width/1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:themedata.isdark?Medicacolor.lightblack:Medicacolor.container,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/66),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width/2,
                                child: Text("Votre réservation a bien été enregistrée. Notre équipe prendra en charge votre demande et vous répondra dans les plus brefs délais. Merci pour votre confiance ",
                                  style: urbanistMedium.copyWith(fontSize: 16),),
                              ),
                              Text(
                                '${DateTime.now().hour}:${DateTime.now().minute}',
                                style: urbanistMedium.copyWith(fontSize: 12, color: Medicacolor.textgray),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/36,vertical: height/86),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width/1.3,
              child: TextFormField(
                cursorColor: Medicacolor.bggray,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(MedicaPngImg.emoji,height: height/36,),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(MedicaPngImg.camera,height: height/36,),
                    ),
                   fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                    filled: true,
                    hintText: "Tapez un message ...".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(24),
                    )),
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Medicacolor.primary,
              child: Image.asset(MedicaPngImg.voice,height: height/36,),
            ),
          ],
        ),
      ),
    );
  }
}
