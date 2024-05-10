import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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



  List<Reservation> reservations = [];

  List chatimg1 = [
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


  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? username = prefs.getString('username');
    print("HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII ");





    if (username != null) {
      print("user name found yessssssssss " +username);

      await fetchReservationsByUsername(username);

    }
    print(serviceNames.length);
    print(serviceNames.length);
    print(serviceNames.length);
    print(serviceNames.length);
    print(serviceNames.length);


  }

  Future<void> fetchReservationsByUsername(String username) async {
    print("Fetching reservations for username: $username");
    final url = Uri.parse('http://10.0.2.2:9097/api/reservations/getbyusername/$username');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("Response body: ${response.body}");

      final List<dynamic> jsonResponse = json.decode(response.body);
      print("JSON response: $jsonResponse");

      serviceNames.clear(); // Clear the serviceNames list before populating it with new data
      usernames.clear(); // Clear the usernames list before populating it with new data
      reservationDateTimes.clear(); // Clear the reservationDateTimes list before populating it with new data
      isConfirmeds.clear(); // Clear the isConfirmeds list before populating it with new data
      userConfirmations.clear(); // Clear the userConfirmations list before populating it with new data

      for (var reservationData in jsonResponse) {
        serviceNames.add(reservationData['serviceName']);
        usernames.add(reservationData['userName']);
        reservationDateTimes.add(reservationData['reservationDateTime']);
        isConfirmeds.add(reservationData['isConfirmed']);
        userConfirmations.add(reservationData['userConfirmation']);
      }

      print("Service names: $serviceNames");
      print("Usernames: $usernames");
      print("Reservation DateTimes: $reservationDateTimes");
      print("Is Confirmeds: $isConfirmeds");
      print("User Confirmations: $userConfirmations");



    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
    }
  }

  @override
  void initState() {
    super.initState();
    loadUserData();


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
          leadingWidth: width / 1,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 26),
            child: Row(
              children: [
                SvgPicture.asset(MedicaSvgImg.logo, height: height / 26),
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
              Text("List Reservation".tr),
              Text("Voice_call".tr),
              Text("Video_call".tr),
            ],
          ),
        ),
        body: FutureBuilder(
          future: loadUserData(), // Call loadUserData which returns a Future
          builder: (context, snapshot) {
            // Check the connection state of the future
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // Once the future is complete, build the UI with fetched data
              return TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 46),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: serviceNames.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(
                                serviceNames[index] ?? 'Service Name Missing',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Username: ${usernames[index] ?? 'Username Missing'}',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  Text(
                                    'Reservation Date: ${reservationDateTimes[index] ?? 'Date Missing'}',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  Text(
                                    'Is Confirmed: ${isConfirmeds[index] ?? 'Confirmation Status Missing'}',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  Text(
                                    'User Confirmation: ${userConfirmations[index] ?? 'User Confirmation Missing'}',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const MedicaChatting();
                                }));
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(),
                  SingleChildScrollView(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}