import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaInvitefriends extends StatefulWidget {
  const MedicaInvitefriends({Key? key}) : super(key: key);

  @override
  State<MedicaInvitefriends> createState() => _MedicaInvitefriendsState();
}

class _MedicaInvitefriendsState extends State<MedicaInvitefriends> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List isselected = [];

  List chatimg = [
    MedicaPngImg.photo1,
    MedicaPngImg.photo2,
    MedicaPngImg.photo3,
    MedicaPngImg.photo4,
    MedicaPngImg.photo5,
    MedicaPngImg.photo6,
    MedicaPngImg.photo7,
    MedicaPngImg.photo4,
    MedicaPngImg.photo1,
    MedicaPngImg.photo2,
    MedicaPngImg.photo3,
  ];

  List chats = ["Lauralee Quintero","Annabel Rohan","Alfonzo Schuessler","Augustina Midgett","Freida Varnes","Francene Vandyne","Geoffrey Mott","Rayford Chenail","Florencio Dorrance","Lauralee Quintero","Annabel Rohan","Alfonzo Schuessler"];

  List subtitle = ["+1-300-555-0135","+1-202-555-0136","+1-300-555-0119","+1-300-555-0161","+1-300-555-0136","+1-202-555-0167","+1-202-555-0119","+1-202-555-0171","+1-300-555-0135","+1-202-555-0136","+1-300-555-0119"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite_Friends".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                     setState(() {
                       if(isselected.contains(index)){
                         isselected.remove(index);
                       }else{
                         isselected.add(index);
                       }
                     });
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Medicacolor.transparent,
                          backgroundImage: AssetImage(chatimg[index].toString()),
                        ),
                        SizedBox(width: width/26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(chats[index].toString(),style: urbanistBold.copyWith(fontSize: 18)),
                            SizedBox(height: height/96),
                            Text(subtitle[index].toString(),style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(height: height/96),
                        Container(
                          decoration: BoxDecoration(
                            color: isselected.contains(index) ?Medicacolor.transparent :Medicacolor.primary,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: isselected.contains(index) ?Medicacolor.primary :Medicacolor.transparent)
                          ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/96),
                              child: Text(isselected.contains(index) ?"Invited":"Invite",style: urbanistSemiBold.copyWith(fontSize: 14,color: isselected.contains(index) ?Medicacolor.primary :Medicacolor.white)),
                            )),
                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) {
              return SizedBox(height: height/36);
            }, itemCount: chatimg.length)
        ),
      ),
    );
  }
}
