import 'package:flutter/material.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_welcome.dart';

class MedicaSplash extends StatefulWidget {
  const MedicaSplash({Key? key}) : super(key: key);

  @override
  State<MedicaSplash> createState() => _MedicaSplashState();
}

class _MedicaSplashState extends State<MedicaSplash> {
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
    await Future.delayed(const Duration(seconds: 5));
    navigator.push(MaterialPageRoute(
      builder: (context) {
        return const MedicaWelcome();
      },
    ));
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Center(
        child: Image.asset(
          MedicaPngImg.logoela,
          height: height/3,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}