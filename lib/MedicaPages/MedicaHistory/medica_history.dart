import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'medica_chatting.dart';
import 'medica_videocall.dart';
import 'medica_voicecall.dart';

class MedicaHistory extends StatefulWidget {
  const MedicaHistory({Key? key}) : super(key: key);

  @override
  State<MedicaHistory> createState() => _MedicaHistoryState();
}

class _MedicaHistoryState extends State<MedicaHistory> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());

  List chats = ["Dr.Drake Boeson","Dr.Aidan Allende","Dr.Salvatore Heredia","Dr.Delaney Mangino","Dr.Beckett Calger","Dr.Bernard Bliss","Dr.Drake Boeson","Dr.Aidan Allende","Dr.Salvatore Heredia"];
  List subtitle = ["My pleasure.All the best for","Your solution is grate!🔥","Thanks for the help doctor🙏🏻","I have recovered,thank you","I went there yestrday😀","IDK what else is there to do..","My pleasure.All the best for","Your solution is grate!🔥","Thanks for the help doctor🙏🏻"];
  List time = ["10.00AM","18:00PM","10:30AM","17:30AM","09:30PM","10:30AM","10.00AM","18:00PM","10:30AM"];
  List date = ["Today","Yesterday","20/12/2022","14/12/2022","26/11/2022","09/11/2022","04/11/2022","03/11/2022","02/11/2022"];
  List chatimg = [
    MedicaPngImg.doctor1,
    MedicaPngImg.doctor2,
    MedicaPngImg.doctor6,
    MedicaPngImg.doctor4,
    MedicaPngImg.doctor5,
    MedicaPngImg.doctor6,
    MedicaPngImg.doctor1,
    MedicaPngImg.doctor2,
    MedicaPngImg.doctor4,
  ];


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: width/1,
          leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/26),
              child: Row(
                children: [
                  SvgPicture.asset(MedicaSvgImg.logo,height: height/26),
                  SizedBox(width: width/16),
                  Text("History".tr,style: urbanistBold.copyWith(fontSize: 24,color: themedata.isdark ? Medicacolor.white : Medicacolor.black)),
                  const Spacer(),
                  Image.asset(MedicaPngImg.search,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
                  SizedBox(width: width/26,),
                  InkWell(
                      splashColor: Medicacolor.transparent,
                      highlightColor: Medicacolor.transparent,
                      onTap: () {
                      },
                      child: Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black)),
                ],
              )
          ),
          bottom: TabBar(
            indicatorColor: Medicacolor.primary,
            dividerColor: Medicacolor.bggray,
            labelColor: Medicacolor.primary,
            labelPadding: EdgeInsets.only(bottom: height/96),
            indicatorPadding: EdgeInsets.symmetric(horizontal: width/26),
            unselectedLabelColor: Medicacolor.textgray,
            unselectedLabelStyle:urbanistSemiBold.copyWith(fontSize: 18 ) ,
            labelStyle: urbanistSemiBold.copyWith(fontSize: 18 ) ,
            tabs: [
              Text("Message".tr,),
              Text("Voice_call".tr,),
              Text("Video_call".tr,),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Medicacolor.transparent,
                          highlightColor: Medicacolor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const MedicaChatting();
                            },));
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                    Text(date[index],style: urbanistRegular.copyWith(fontSize: 13,color: Medicacolor.textgray)),
                                  SizedBox(height: height/96),
                                  Text(time[index].toString(),style: urbanistMedium.copyWith(fontSize: 13,color: Medicacolor.textgray)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }, separatorBuilder: (context, index) {
                    return SizedBox(height: height/36);
                  }, itemCount: chatimg.length)
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
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
                                  child: Image.asset(chatimg[index],height: height/8,width: height/8,fit: BoxFit.fitHeight,),
                                ),
                                SizedBox(
                                  width: width/2.3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(chats[index],style: urbanistBold.copyWith(fontSize: 18)),
                                      SizedBox(height: height/86),
                                      Text("Voice_call".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                      SizedBox(height: height/76),
                                      Text("Today | 14:00 PM",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Medicacolor.transparent,
                                  highlightColor: Medicacolor.transparent,
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return const MedicaVoicecall();
                                    },));
                                  },
                                  child: const CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Medicacolor.lightprimary,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Medicacolor.primary,
                                      child: Icon(Icons.arrow_forward_ios,size: 12,color: Medicacolor.white,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (context, index) {
                    return SizedBox(height: height/36);
                  }, itemCount: chats.length)
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
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
                                  child: Image.asset(chatimg[index],height: height/8,width: height/8,fit: BoxFit.fitHeight,),
                                ),
                                SizedBox(
                                  width: width/2.3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(chats[index],style: urbanistBold.copyWith(fontSize: 18)),
                                      SizedBox(height: height/86),
                                      Text("Video_call".tr,style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                      SizedBox(height: height/76),
                                      Text("Today | 14:00 PM",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Medicacolor.transparent,
                                  highlightColor: Medicacolor.transparent,
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return const MedicaVideocall();
                                    },));
                                  },
                                  child: const CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Medicacolor.lightprimary,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Medicacolor.primary,
                                      child: Icon(Icons.arrow_forward_ios,size: 12,color: Medicacolor.white,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (context, index) {
                    return SizedBox(height: height/36);
                  }, itemCount: chats.length)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
