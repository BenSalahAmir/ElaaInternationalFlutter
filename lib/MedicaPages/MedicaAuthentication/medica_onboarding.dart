import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_loginoption.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:nb_utils/nb_utils.dart';

class MedicaOnboarding extends StatefulWidget {
  const MedicaOnboarding({Key? key}) : super(key: key);

  @override
  State<MedicaOnboarding> createState() => _MedicaOnboardingState();
}

class _MedicaOnboardingState extends State<MedicaOnboarding> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  var pageController = PageController();
  final themedata = Get.put(MedicaThemecontroler());
  List<Widget> pages = [];
  var selectedIndex = 0;

  init() {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    pages = [
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height / 16,
            ),
            Image.asset(
              MedicaPngImg.onboard1,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Text(
              "Thousands_of_doctors_experts_to_help_your_health".tr,
              style: urbanistBold.copyWith(fontSize: 35,color: themedata.isdark ? Medicacolor.white :  Medicacolor.primary),
              textAlign: TextAlign.center,
            ),
           const Spacer(),
            Container(
              height: height / 15,
              width: width/1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Medicacolor.primary,
              ),
              child: Center(
                child: Text(
                  "Next".tr,
                  style: urbanistBold.copyWith(
                      fontSize: 16, color: Medicacolor.white),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height / 16,
            ),
            Image.asset(
              MedicaPngImg.onboard2,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Text(
              "Health_checks_consultations_easily_anywhere_anytime".tr,
              style: urbanistBold.copyWith(fontSize: 35,color: themedata.isdark ? Medicacolor.white :  Medicacolor.primary),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Container(
              height: height / 15,
              width: width/1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Medicacolor.primary,
              ),
              child: Center(
                child: Text(
                  "Next".tr,
                  style: urbanistBold.copyWith(
                      fontSize: 16, color: Medicacolor.white),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height / 26,
            ),
            SvgPicture.asset(
              MedicaSvgImg.onboard3,
              height: height/3,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Text(
              "Lets_start_living_healthy_and_well_with_us_right_now".tr,
              style: urbanistBold.copyWith(fontSize: 35,color: themedata.isdark ? Medicacolor.white : Medicacolor.primary),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            InkWell(
              splashColor: Medicacolor.transparent,
              highlightColor: Medicacolor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MedicaLoginoption();
                },));
              },
              child: Container(
                height: height / 15,
                width: width/1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Medicacolor.primary,
                ),
                child: Center(
                  child: Text(
                    "Get_Started".tr,
                    style: urbanistBold.copyWith(
                        fontSize: 16, color: Medicacolor.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (index) {
              selectedIndex = index;
              setState(() {});
            },
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            bottom: 90,
            left: 0,
            right: 0,
            child: DotIndicator(
                unselectedIndicatorColor: Medicacolor.lightgrey,
                pageController: pageController,
                pages: pages,
                dotSize: 8.00,
                currentDotSize: 10.00,
                indicatorColor: Medicacolor.primary),
          ),
        ],
      ),
    );
  }
}