import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/models/ServiceContrat.dart';

class MedicaDoctorDetails extends StatefulWidget {
  final String serviceName;

  MedicaDoctorDetails({required this.serviceName});

  @override
  State<MedicaDoctorDetails> createState() => _MedicaDoctorDetailsState();
}

class _MedicaDoctorDetailsState extends State<MedicaDoctorDetails> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  ServiceContrat? service;
  double? averageScore;
  int? reviewCount;





  Map<String, String> serviceImageMap = {
    "Expertise": MedicaPngImg.Expertiseservices,
    "Remorquage": MedicaPngImg.remorquageservice,
    "Technicien de laboratoire et analyse": MedicaPngImg.labotechnicienservice,
    "Technicien de kine": MedicaPngImg.kine,
    "Second avis medical": MedicaPngImg.articleservice,
    "Evasan": MedicaPngImg.Evasan,
    "Retour a domicile": MedicaPngImg.retourDomicileservice,
    "Billetterie": MedicaPngImg.billetterieservices,
    "Hospitalisation": MedicaPngImg.hospitalisationservice,
    "Avocat": MedicaPngImg.avocatservices,
    "Ambulance": MedicaPngImg.Ambulance,
    "Plomberie": MedicaPngImg.plombierservices,
    "Serrurier": MedicaPngImg.serrurierservices,
    "Vitrier": MedicaPngImg.Vitrierservices,
    "Electricien": MedicaPngImg.electricienservices,
    "Infirmier": MedicaPngImg.infirmierservice,
    "Reparation": MedicaPngImg.Reparationservices,
  };

  @override
  void initState() {
    super.initState();
    fetchService();
    fetchAverageScore();
    fetchReviewCount();

  }

  Future<void> fetchService() async {
    service = await fetchServiceByName(widget.serviceName);
    setState(() {});
  }

  Future<void> fetchReviewCount() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:9098/api/reviews/count/${widget.serviceName}'));
    if (response.statusCode == 200) {
      setState(() {
        reviewCount = int.parse(response.body);
      });
    } else {
      setState(() {
        reviewCount = null;
      });
    }
  }

  Future<ServiceContrat?> fetchServiceByName(String serviceName) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:9098/api/services/getbyname/$serviceName'));
    if (response.statusCode == 200) {
      return ServiceContrat.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<void> fetchAverageScore() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:9098/api/reviews/score/${widget.serviceName}'));
    if (response.statusCode == 200) {
      setState(() {
        averageScore = double.parse(response.body);
      });
    } else {
      setState(() {
        averageScore = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: width / 10,
        title: Row(
          children: [
            Text(widget.serviceName, style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.wishlist, height: height / 36, color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width / 26),
            Image.asset(MedicaPngImg.moreoption, height: height / 36, color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: service == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          serviceImageMap[service!.serviceName] ?? MedicaPngImg.defaultImage,
                          height: height / 8,
                          width: height / 8,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(
                        width: width / 1.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(service!.serviceName, style: urbanistBold.copyWith(fontSize: 18)),
                            SizedBox(height: height / 86),
                            Container(
                              height: height / 500,
                              width: width / 1.5,
                              color: themedata.isdark ? Medicacolor.lightblack : Medicacolor.lightgrey,
                            ),
                            SizedBox(height: height / 86),
                            Text("Immunologists", style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray)),
                            SizedBox(height: height / 76),
                            Text("Christ Hospital in London,UK", style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(MedicaPngImg.user3,height: height/36,color: Medicacolor.primary),
                      ),
                      SizedBox(height: height/96),
                      Text("5,000+",style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),
                      SizedBox(height: height/96),
                      Text("patients".tr,style: urbanistMedium.copyWith(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(MedicaPngImg.status,height: height/26,color: Medicacolor.primary),
                      ),
                      SizedBox(height: height/96),
                      Text("10+",style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),
                      SizedBox(height: height/96),
                      Text("années d'expérience".tr,style: urbanistMedium.copyWith(fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Icon(Icons.star_rate_rounded,size: height/26,color: Medicacolor.primary,),
                      ),
                      SizedBox(height: height/180),
                      Text(averageScore != null ? averageScore!.toStringAsFixed(1) : "N/A",
                          style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),                      SizedBox(height: height/180),
                      Text("avis".tr,style: urbanistMedium.copyWith(fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                  SizedBox(width: width/26),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Medicacolor.lightprimary,
                        child: Image.asset(MedicaPngImg.msg,height: height/30,color: Medicacolor.primary),
                      ),
                      SizedBox(height: height/180),
                      Text(reviewCount != null ? reviewCount.toString() : "N/A",
                          style: urbanistBold.copyWith(fontSize: 18,color: Medicacolor.primary)),                      SizedBox(height: height/180),
                      Text("avis".tr,style: urbanistMedium.copyWith(fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height/36),
              Text("Description du service", style: urbanistBold.copyWith(fontSize: 20)),
              SizedBox(height: height / 96),
              Text(service!.description, style: urbanistMedium.copyWith(fontSize: 14)),
              SizedBox(height: height / 36),
              // Add more details or sections as needed
            ],
          ),
        ),
      ),
    );
  }
}

