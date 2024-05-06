import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAppointment/medica_appoinment.dart';
import 'package:medica/MedicaPages/MedicaArticies/medica_articies.dart';
import 'package:medica/MedicaPages/MedicaHistory/medica_history.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_home.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_profile.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaDashboard extends StatefulWidget {
  const MedicaDashboard({Key? key}) : super(key: key);

  @override
  State<MedicaDashboard> createState() => _MedicaDashboardState();
}

class _MedicaDashboardState extends State<MedicaDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  int _selectedItemIndex = 0;

  final List<Widget> _pages = const [
    MedicaHome(),
    MedicaAppoinment(),
    MedicaHistory(),
    MedicaArticies(),
    MedicaProfile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _bottomTabBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Medicacolor.transparent,
      elevation: 0,
      selectedLabelStyle: urbanistBold.copyWith(fontSize: 10),
      selectedItemColor: Medicacolor.primary,
      unselectedLabelStyle: urbanistMedium.copyWith(fontSize: 10),
      unselectedItemColor: Medicacolor.textgray,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(MedicaPngImg.home,
              height: height / 36,
              color: themedata.isdark ? Medicacolor.white : Medicacolor.textgray),
          activeIcon: Image.asset(MedicaPngImg.activehome,
              color: Medicacolor.primary,
              height: height / 36),
          label: 'Home'.tr,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(MedicaPngImg.appoinment,
              height: height / 36,
              color: themedata.isdark ? Medicacolor.white : Medicacolor.textgray),
          activeIcon: Image.asset(MedicaPngImg.activecalender,
              color: Medicacolor.primary,
              height: height / 36),
          label: 'services'.tr,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(MedicaPngImg.history,
              height: height / 40,
              color: themedata.isdark ? Medicacolor.white : Medicacolor.textgray),
          activeIcon: Image.asset(MedicaPngImg.activehistory,
              color: Medicacolor.primary,
              height: height / 40),
          label: 'historique'.tr,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(MedicaPngImg.articies,
              height: height / 36,
              color: themedata.isdark ? Medicacolor.white : Medicacolor.textgray),
          activeIcon: Image.asset(MedicaPngImg.activearticies,
              color: Medicacolor.primary,
              height: height / 36),
          label: 'Articies'.tr,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(MedicaPngImg.profile,
              height: height / 36,
              color: themedata.isdark ? Medicacolor.white : Medicacolor.textgray),
          activeIcon: Image.asset(MedicaPngImg.activeprofile,
              color: Medicacolor.primary,
              height: height / 36),
          label: 'Profil'.tr,
        ),
      ],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      bottomNavigationBar: _bottomTabBar(),
      body: _pages[_selectedItemIndex],
    );
  }
}
