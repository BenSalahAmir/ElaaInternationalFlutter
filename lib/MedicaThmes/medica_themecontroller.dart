import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_prefs.dart';
import 'package:medica/MedicaThmes/medica_theme.dart';
import 'package:nb_utils/nb_utils.dart';

class MedicaThemecontroler extends GetxController{
  @override
  void onInit()
  {
    SharedPreferences.getInstance().then((value) {
      isdark = value.getBool(isDarkMode)!;
    });
    update();
    super.onInit();
  }

  var isdark = false;
  Future<void> changeTheme (state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdark = prefs.getBool(isDarkMode) ?? true;
    isdark = !isdark;

    if (state == true) {
      Get.changeTheme(MedicaMythemes.darkTheme);
      isdark = true;
    }
    else {
      Get.changeTheme(MedicaMythemes.lightTheme);
      isdark = false;
    }
    update();
  }

}