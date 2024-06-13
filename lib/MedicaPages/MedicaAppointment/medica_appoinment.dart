import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAppointment/ServiceDetails.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_appointmentdetails.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_cancelappoinment.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_reschedule.dart';
import 'package:medica/MedicaPages/MedicaHistory/medica_chatting.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_doctordetails.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:medica/Service/NotificationServiceLocalNotification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/Reservation.dart';


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


  List callimg = [
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
    MedicaPngImg.msg,
  ];

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


  List title = [
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
    "Messagerie",
  ];
  List<String> serviceNames = [];
  List<String> serviceNames1 = [];
  String? email;
  String? username;

  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    loadUserData();
    fetchServices1();

  }


  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    username = prefs.getString('username');


    if (email != null) {
      await fetchServices(email);
    }
  }

  Future<void> fetchServices1() async {
    final url = Uri.parse('http://10.0.2.2:9098/api/services');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> servicesJson = json.decode(response.body);
      setState(() {
        serviceNames1 = servicesJson.map((service) => service['serviceName'].toString()).toList();
      });
    } else {
      throw Exception('Failed to load services');
    }
  }

  void goToChat() async {
    await Future.delayed(const Duration(seconds: 0));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MedicaChatting()),
    );
  }


  Future<void> createReservation(BuildContext context, Reservation reservation, Function(bool) callback) async {
    try {
      setState(() {
        _isLoading = true; // Set loading state
      });

      // Show confirmation dialog
      bool confirmReservation = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Voulez-vous réserver ce service?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // User confirmed reservation
                },
                child: Text('Oui'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // User canceled reservation
                },
                child: Text('Non'),
              ),
            ],
          );
        },
      );

      // Reset loading state
      setState(() {
        _isLoading = false;
      });

      // Check user's choice
      if (confirmReservation == true) {
      //  alertSuccess();

        // User confirmed, proceed with reservation
        final url = Uri.parse('http://10.0.2.2:9098/api/reservations/add');
        final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(reservation.toJson()),
        );


        if (response.statusCode == 200) {

          // Show success alert
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text("Réservation créée avec succès."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      goToChat(); // Call gotochat() method
                      callback(true); // Call the callback function
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          // Show error alert
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Failed to create reservation.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      callback(false); // Call the callback function
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // User canceled reservation
      }
    } catch (e) {
      // Handle exceptions
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text("An error occurred: $e"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  callback(false); // Call the callback function
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  alertSuccess() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(52)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 46, vertical: height / 46),
              child: Column(
                children: [
                  Image.asset(MedicaPngImg.signinsuccess, height: height / 6, fit: BoxFit.fill),
                  SizedBox(height: height / 36),
                  Text("Toutes nos félicitations".tr,
                      style: urbanistBold.copyWith(fontSize: 24, color: Medicacolor.primary),
                      textAlign: TextAlign.center),
                  SizedBox(height: height / 86),
                  Text("Votre Reservation a été envoyée avec succès".tr,
                      style: urbanistRegular.copyWith(fontSize: 16), textAlign: TextAlign.center),
                  SizedBox(height: height / 46),
                  Image.asset(MedicaPngImg.circular, height: height / 20),
                ],
              ),
            )
          ],
        );
      },
    );

    //await Future.delayed(Duration(seconds: 5));

    // Close the dialog
    Navigator.pop(context);
  }

  Future<void> getallServices() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('http://10.0.2.2:9098/api/services');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> servicesJson = json.decode(response.body);
      setState(() {
        serviceNames = servicesJson.map((service) => service['serviceName'].toString()).toList();
      });
    } else {
      throw Exception('Failed to load services');
    }

  }






  Future<void> fetchServices(String email) async {
    final url = Uri.parse('http://10.0.2.2:9098/api/services/test/$email');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> servicesJson = json.decode(response.body);
      setState(() {
        serviceNames = servicesJson.map((service) => service['serviceName'].toString()).toList();
        print('ok: $email');

      });


    } else {
      print('Error: $email');
      throw Exception('Échec du chargement des services');
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: width/1,
          leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/26),
              child: Row(
                children: [
                  Image.asset(
                      MedicaPngImg.logowithoutback,
                      height: height/26),
                  SizedBox(width: width/16),
                  Text("Services".tr,style: urbanistBold.copyWith(fontSize: 24)),
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
              Text("service autorisé".tr,),
              Text("tous les services".tr,),
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
                                                    child: Text("Disponible".tr, style: urbanistSemiBold.copyWith(fontSize: 12, color: Medicacolor.green)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: height / 66),
                                            Text("Toujours disponible", style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray)),
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
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MedicaDoctorDetails(serviceName: serviceNames[index]),
                                            ),
                                          );
                                          },
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Medicacolor.primary),
                                          ),
                                          child: Center(
                                            child: Text("Description du service".tr, style: urbanistSemiBold.copyWith(fontSize: 12, color: Medicacolor.primary)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Medicacolor.transparent,
                                        highlightColor: Medicacolor.transparent,
                                        onTap: () {
                                          String selectedService = serviceNames[index]; // Get the selected service name from the index
                                          Reservation reservation = Reservation(
                                            serviceName: selectedService,
                                            userName: username ?? '', // Use the userName attribute here
                                            userConfirmation: '', // You need to set this according to your logic
                                            reservationDateTime: DateTime.now(), // You need to set this according to your logic
                                            isConfirmed: false,
                                          );
                                          createReservation(context, reservation, (bool success) {
                                            setState(() {
                                              _isLoading = false; // Stop loading state
                                            });
                                          });
                                        },
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Medicacolor.primary,
                                          ),
                                          child: Center(

                                            child:
                                            Text(
                                              "Réserver le service".tr,
                                              style: urbanistSemiBold.copyWith(fontSize: 15, color: Medicacolor.white),
                                            ),
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
                  child: Column(
                    children: [

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
                                        child: Image.asset(serviceImageMap[serviceNames1[index]] ?? MedicaPngImg.defaultImage, height: height / 8, width: height / 8, fit: BoxFit.fitHeight),
                                      ),
                                      SizedBox(
                                        width: width / 2.3,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(serviceNames1[index], style: urbanistBold.copyWith(fontSize: 18)),
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
                                                    child: Text("indisponible".tr, style: urbanistSemiBold.copyWith(fontSize: 10, color: Medicacolor.green)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: height / 66),
                                            Text("occupé", style: urbanistMedium.copyWith(fontSize: 14, color: Medicacolor.textgray)),
                                          ],
                                        ),
                                      ),

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
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MedicaDoctorDetails(serviceName: serviceNames1[index]),
                                            ),
                                          );



                                        },
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Medicacolor.primary),
                                          ),
                                          child: Center(
                                            child: Text("Description du service".tr, style: urbanistSemiBold.copyWith(fontSize: 12, color: Medicacolor.primary)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Medicacolor.transparent,
                                        highlightColor: Medicacolor.transparent,
                                        onTap: () {

                                        },
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Medicacolor.primary,
                                          ),
                                          child: Center(
                                            child: Text("Ajout Service".tr, style: urbanistSemiBold.copyWith(fontSize: 15, color: Medicacolor.white)),
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
                        itemCount: serviceNames1.length, // Use serviceNames.length instead of chats.length
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
  
  
  











}
