import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_appointmentdetails.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_cancelappoinment.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_reschedule.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class MedicaAppoinment extends StatefulWidget {
  const MedicaAppoinment({Key? key}) : super(key: key);

  @override
  State<MedicaAppoinment> createState() => _MedicaAppoinmentState();
}

class _MedicaAppoinmentState extends State<MedicaAppoinment> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List chats = ["Dr.Drake Boeson","Dr.Aidan Allende","Dr.Salvatore Heredia","Dr.Delaney Mangino","Dr.Beckett Calger"];
  List chatimg = [
    MedicaPngImg.articleservice,
    MedicaPngImg.avocatservices,
    MedicaPngImg.billetterieservices,
    MedicaPngImg.electricienservices,
    MedicaPngImg.Expertiseservices,
    MedicaPngImg.labotechnicienservice,
    MedicaPngImg.hospitalisationservice,
    MedicaPngImg.infirmierservice,
    MedicaPngImg.plombierservices,
    MedicaPngImg.Rapatriementservices,
    MedicaPngImg.Reparationservices,
    MedicaPngImg.sanitaireservice,
    MedicaPngImg.serrurierservices,
    MedicaPngImg.retourDomicileservice,
    MedicaPngImg.remorquageservice,
    MedicaPngImg.Vitrierservices,
    MedicaPngImg.doctor2,
    MedicaPngImg.doctor6,
  ];

  List callimg = [
    MedicaPngImg.msg,
    MedicaPngImg.phone,
    MedicaPngImg.video,
    MedicaPngImg.msg,
    MedicaPngImg.phone,
    MedicaPngImg.msg,
    MedicaPngImg.phone,
    MedicaPngImg.video,
    MedicaPngImg.msg,
    MedicaPngImg.phone,
    MedicaPngImg.msg,
    MedicaPngImg.phone,
    MedicaPngImg.video,
    MedicaPngImg.msg,
    MedicaPngImg.phone,
    MedicaPngImg.msg,
    MedicaPngImg.phone,
    MedicaPngImg.video,
  ];

  Map<String, String> serviceImageMap = {
    "Infirmier": MedicaPngImg.infirmierservice,
    "Electricien": MedicaPngImg.electricienservices,
    "Vitrier": MedicaPngImg.Vitrierservices,
    "Serrurier": MedicaPngImg.serrurierservices,
    "Plomberie": MedicaPngImg.plombierservices,
    "Reparation": MedicaPngImg.Reparationservices,
    "Expertise": MedicaPngImg.Expertiseservices,
    "Remorquage": MedicaPngImg.remorquageservice,
    "Technicien de laboratoire et analyse": MedicaPngImg.labotechnicienservice,
    "Technicien de kine": MedicaPngImg.doctor2,
    "Second avis medical": MedicaPngImg.articleservice,
    "Rapatriement": MedicaPngImg.Rapatriementservices,
    "Sanitaire": MedicaPngImg.sanitaireservice,
    "Evasan": MedicaPngImg.doctor6,
    "Retour a domicile": MedicaPngImg.retourDomicileservice,
    "Billetterie": MedicaPngImg.billetterieservices,
    "Hospitalisation": MedicaPngImg.hospitalisationservice,
    "Avocat": MedicaPngImg.avocatservices,
  };


  List title = [
    "Messaging",
    "Video Call",
    "Video Call",
    "Messaging",
    "Video Call",
    "Messaging",
    "Video Call",
    "Video Call",
    "Messaging",
    "Video Call",
    "Messaging",
    "Video Call",
    "Video Call",
    "Messaging",
    "Video Call",
    "Messaging",
    "Video Call",
    "Video Call",
  ];
  List<String> serviceNames = [];
  String? email;

  @override
  void initState() {
    super.initState();
    loadUserData();

  }


  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email != null) {
      await fetchServices(email);
    }
  }





  Future<void> fetchServices(String email) async {
    final url = Uri.parse('http://10.0.2.2:9091/api/services/test/$email');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> servicesJson = json.decode(response.body);
      setState(() {
        serviceNames = servicesJson.map((service) => service['serviceName'].toString()).toList();
        print('ok: $email');

      });


    } else {
      print('Error: $email');
      throw Exception('Failed to load services');
    }
  }

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
                  Text("My_Appointment".tr,style: urbanistBold.copyWith(fontSize: 24)),
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
              Text("Upcoming".tr,),
              Text("Completed".tr,),
              Text("Cancelled".tr,),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/10),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset(MedicaPngImg.empty,height: height/3.5,fit: BoxFit.fitHeight,),
                      //       SizedBox(height: height/16,),
                      //       Text("You_dont_have_an_appointment_yet".tr,style: urbanistSemiBold.copyWith(fontSize: 18),),
                      //       SizedBox(height: height/46,),
                      //       Text("You_dont_have_a_doctor_appointment_scheduled_at_the_moment".tr,style: urbanistRegular.copyWith(fontSize: 16,color: Medicacolor.textgray ),textAlign: TextAlign.center,),
                      //
                      //     ],
                      //   ),
                      // )
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: themedata.isdark ? Medicacolor.transparent : Medicacolor.lightgrey,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 66),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(serviceImageMap[serviceNames[index]] ?? MedicaPngImg.defaultImage, height: height / 8, width: height / 8, fit: BoxFit.fitHeight),
                                      ),
                                      SizedBox(
                                        width: width / 2.3,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(serviceNames[index], style: urbanistBold.copyWith(fontSize: 18)),
                                            SizedBox(height: height / 66),
                                            Row(
                                              children: [
                                                Text("${title[index]} - ", style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray)),
                                                Container(
                                                  height: height / 35,
                                                  width: width / 5,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(color: Medicacolor.green),
                                                  ),
                                                  child: Center(
                                                    child: Text("Completed".tr, style: urbanistSemiBold.copyWith(fontSize: 12, color: Medicacolor.green)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: height / 66),
                                            Text("Today | 16:00 PM", style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray)),
                                          ],
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Medicacolor.lightprimary,
                                        child: Image.asset(callimg[index].toString(), height: height / 36, color: Medicacolor.primary),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height / 96),
                                  Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey),
                                  SizedBox(height: height / 96),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Medicacolor.transparent,
                                        highlightColor: Medicacolor.transparent,
                                        onTap: () {},
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Medicacolor.primary),
                                          ),
                                          child: Center(
                                            child: Text("Book_Again".tr, style: urbanistSemiBold.copyWith(fontSize: 15, color: Medicacolor.primary)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Medicacolor.transparent,
                                        highlightColor: Medicacolor.transparent,
                                        onTap: () {},
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Medicacolor.primary,
                                          ),
                                          child: Center(
                                            child: Text("Leave_a_Review".tr, style: urbanistSemiBold.copyWith(fontSize: 15, color: Medicacolor.white)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height / 36);
                        },
                        itemCount: serviceNames.length, // Use serviceNames.length instead of chats.length
                      )

                    ],
                  )
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
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
                            child: Column(
                              children: [
                                Row(
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
                                          Text(serviceNames[index], style: urbanistBold.copyWith(fontSize: 18)),
                                          SizedBox(height: height/66),
                                          Row(
                                            children: [
                                              Text("${title[index]} - ",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                               Container(
                                                 height: height/35,
                                                 width: width/5,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(5),
                                                   border: Border.all(color:Medicacolor.green),
                                                 ),
                                                 child: Center(
                                                   child: Text("Completed".tr,style: urbanistSemiBold.copyWith(fontSize: 12,color:Medicacolor.green)),
                                                 ),
                                               ),
                                            ],
                                          ),
                                          SizedBox(height: height/66),
                                          Text("Today | 16:00 PM",style: urbanistMedium.copyWith(fontSize: 14,color: Medicacolor.textgray)),
                                        ],
                                      ),
                                    ),
                                     CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Medicacolor.lightprimary,
                                      child: Image.asset(callimg[index].toString(),height: height/36,color: Medicacolor.primary,),
                                    )
                                  ],
                                ),
                                SizedBox(height: height/96),
                                Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                                SizedBox(height: height/96),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      splashColor:Medicacolor.transparent,
                                      highlightColor:Medicacolor.transparent,
                                      onTap: () {

                                      },
                                      child: Container(
                                        height: height/22,
                                        width: width/2.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(color:Medicacolor.primary),
                                        ),
                                        child: Center(
                                          child: Text("Book_Again".tr,style: urbanistSemiBold.copyWith(fontSize: 15,color:Medicacolor.primary)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:Medicacolor.transparent,
                                      highlightColor:Medicacolor.transparent,
                                      onTap: () {

                                      },
                                      child: Container(
                                        height: height/22,
                                        width: width/2.2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color:Medicacolor.primary,
                                        ),
                                        child: Center(
                                          child: Text("Leave_a_Review".tr,style: urbanistSemiBold.copyWith(fontSize: 15,color:Medicacolor.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (context, index) {
                    return SizedBox(height: height/36);
                  },
                    itemCount: serviceNames.length,
                  )
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(MedicaPngImg.empty,height: height/3.5,fit: BoxFit.fitHeight,),
                            SizedBox(height: height/16,),
                            Text("You_dont_have_an_appointment_yet".tr,style: urbanistSemiBold.copyWith(fontSize: 18),),
                            SizedBox(height: height/46,),
                            Text("You_dont_have_a_doctor_appointment_scheduled_at_the_moment".tr,style: urbanistRegular.copyWith(fontSize: 16,color: Medicacolor.textgray ),textAlign: TextAlign.center,),

                          ],
                        ),
                      )

                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  
  
  cancelappintment() {
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
                  height: height / 3,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                    child: Column(
                      children: [
                        Text("Cancel_Appointment".tr,style: urbanistBold.copyWith(fontSize: 20,color: Medicacolor.red)),
                        SizedBox(height: height/96),
                        Divider(color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,),
                        SizedBox(height: height/96),
                        Text("Are_you_sure_you_want_to_cancel_your_appointment".tr,style: urbanistMedium.copyWith(fontSize: 16),textAlign: TextAlign.center,),
                        SizedBox(height: height/96),
                        Text("Only_50_of_the_funds_will_be_returned_to_your_account".tr,style: urbanistMedium.copyWith(fontSize: 16),textAlign: TextAlign.center,),
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
                                child: Center(child: Text("Back".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary),)),
                              ),
                            ),
                            InkWell(
                              splashColor: Medicacolor.transparent,
                              highlightColor: Medicacolor.transparent,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const MedicaCancelAppoinment();
                                },));
                              },
                              child: Container(
                                height: height/16,
                                width: width/2.2,
                                decoration: BoxDecoration(
                                  color: Medicacolor.primary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(child: Text("Yes_Cancel".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
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
