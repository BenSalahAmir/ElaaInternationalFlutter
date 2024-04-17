import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_onboarding.dart';

class MedicaWelcome extends StatefulWidget {
  const MedicaWelcome({Key? key}) : super(key: key);

  @override
  State<MedicaWelcome> createState() => _MedicaWelcomeState();
}

class _MedicaWelcomeState extends State<MedicaWelcome> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  void initState() {
    super.initState();
    goup();
  }

  goup() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 4));
    navigator.push(MaterialPageRoute(
      builder: (context) {
        return const MedicaOnboarding();
      },
    ));
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Image.asset(MedicaPngImg.welcome),
          SizedBox(height: height/16),
          Text("Welcome to Elaa International".tr,style: urbanistBold.copyWith(fontSize: 48,color: Medicacolor.primary),textAlign: TextAlign.center),
          SizedBox(height: height/46),
          Text("Un Seul interlocuteur plusieurs services".tr,
              style: urbanistMedium.copyWith(fontSize: 18),textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
