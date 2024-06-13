import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaPages/MedicaHistory/AddReviewPage.dart';
import 'package:medica/MedicaPages/MedicaHistory/ElaaInternationalReview.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medica/models/Reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'medica_chatting.dart';
import 'medica_videocall.dart';
import 'medica_voicecall.dart';
import 'package:http/http.dart' as http;

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


  List<Reservation> reservations = [];



  List<String> serviceNames = [];
  List<String> usernames = [];
  List<String> reservationDateTimes = [];
  List<String> isConfirmeds = [];
  List<String> userConfirmations  = [];

  String? Adressemail;

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
    "Technicien de kine": MedicaPngImg.kine,
    "Second avis medical": MedicaPngImg.articleservice,
    "Evasan": MedicaPngImg.Evasan,
    "Retour a domicile": MedicaPngImg.retourDomicileservice,
    "Billetterie": MedicaPngImg.billetterieservices,
    "Hospitalisation": MedicaPngImg.hospitalisationservice,
    "Avocat": MedicaPngImg.avocatservices,
    "Ambulance": MedicaPngImg.Ambulance,

  };
  String _result = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? username = prefs.getString('username');

    if (email != null){
      _result = await getNombreDeclarations(email);
    }

    if (username != null) {
      await fetchReservationsByUsername(username);
    }
  }

  Future<String> getNombreDeclarations(String email) async {
    final url = Uri.parse('http://10.0.2.2:9098/api/reservations/nombre-declarations?email=$email');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body; // The server returned a 200 OK response
    } else if (response.statusCode == 404) {
      return "Email not found"; // The server returned a 404 Not Found response
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchReservationsByUsername(String username) async {
    final url = Uri.parse('http://10.0.2.2:9098/api/reservations/getbyusername/$username');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      serviceNames.clear();
      usernames.clear();
      reservationDateTimes.clear();
      isConfirmeds.clear();
      userConfirmations.clear();

      for (var reservationData in jsonResponse) {
        serviceNames.add(reservationData['serviceName']);
        usernames.add(reservationData['userName']);
        reservationDateTimes.add(reservationData['reservationDateTime']);
        isConfirmeds.add(reservationData['isConfirmed']);
        userConfirmations.add(reservationData['userConfirmation']);
      }
    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: width / 1,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 26),
            child: Row(
              children: [
                Image.asset(MedicaPngImg.logowithoutback, height: height / 26),
                SizedBox(width: width / 16),
                Text(
                  "Historique".tr,
                  style: urbanistBold.copyWith(
                    fontSize: 24,
                    color: themedata.isdark ? Medicacolor.white : Medicacolor.black,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  MedicaPngImg.search,
                  height: height / 36,
                  color: themedata.isdark ? Medicacolor.white : Medicacolor.black,
                ),
                SizedBox(width: width / 26),
                InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () {},
                  child: Image.asset(
                    MedicaPngImg.moreoption,
                    height: height / 36,
                    color: themedata.isdark ? Medicacolor.white : Medicacolor.black,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            indicatorColor: Medicacolor.primary,
            dividerColor: Medicacolor.bggray,
            labelColor: Medicacolor.primary,
            labelPadding: EdgeInsets.only(bottom: height / 96),
            indicatorPadding: EdgeInsets.symmetric(horizontal: width / 26),
            unselectedLabelColor: Medicacolor.textgray,
            unselectedLabelStyle: urbanistSemiBold.copyWith(fontSize: 18),
            labelStyle: urbanistSemiBold.copyWith(fontSize: 18),
            tabs: [
              Text("Historique".tr),
            ],
          ),
        ),
        body: FutureBuilder(
          future: loadUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 46),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          String serviceImage = serviceImageMap[serviceNames[index]] ?? MedicaPngImg.defaultImage;

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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      serviceImage,
                                      height: height / 8,
                                      width: height / 8,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 2.3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(serviceNames[index], style: urbanistBold.copyWith(fontSize: 18)),
                                        SizedBox(height: height / 86),
                                        Text(
                                          "confirmé par ${userConfirmations[index]}",
                                          style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray),
                                        ),
                                        SizedBox(height: height / 76),
                                        Text(
                                          reservationDateTimes[index],
                                          style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray),
                                        ),
                                        Text(
                                          "Nombre de declaration  " + _result,
                                          style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      if (isConfirmeds[index] == 'Confirmed')
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: height / 24,
                                        ),
                                      SizedBox(height: height / 80), // Added space between icons
                                      Text(
                                        isConfirmeds[index] ?? 'Confirmation Status Missing',
                                        style: urbanistMedium.copyWith(
                                          fontSize: 9,
                                          color: isConfirmeds[index] == 'Confirmed' ? Colors.green : Colors.red,
                                        ),
                                      ),
                                      SizedBox(height: height / 70), // Added space between icons
                                      if (isConfirmeds[index] == 'Confirmed')
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(
                                              builder: (context) {
                                                return const AddReviewPage();
                                              },
                                            )
                                            );                                          },

                                          child: Column(
                                            children: [
                                              Image.asset(
                                                MedicaPngImg.wishlist,
                                                height: height / 30,
                                                color: themedata.isdark ? Medicacolor.red : Medicacolor.black,
                                              ),

                                              SizedBox(height: height / 90), // Added space between icons and text
                                              Text(
                                                "Add Review",
                                                style: urbanistMedium.copyWith(
                                                  fontSize: 9,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
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
                        itemCount: serviceNames.length,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
