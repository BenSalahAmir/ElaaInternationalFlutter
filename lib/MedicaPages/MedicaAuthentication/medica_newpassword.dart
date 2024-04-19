import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:http/http.dart' as http;

class MedicaNewPassword extends StatefulWidget {
  const MedicaNewPassword({Key? key}) : super(key: key);

  @override
  State<MedicaNewPassword> createState() => _MedicaNewPasswordState();
}

class _MedicaNewPasswordState extends State<MedicaNewPassword> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool isChecked = false;
  final themedata = Get.put(MedicaThemecontroler());

  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Medicacolor.primary;
    }
    return Medicacolor.primary;
  }

  Future<void> resetPassword() async {
    final String url = 'http://10.0.2.2:9098/api/auth/resetPassword';
    final String email = emailController.text;
    final String code = codeController.text;
    final String newPassword = newPasswordController.text;

    final Map<String, String> body = {
      'email': email,
      'code': code,
      'password': newPassword,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['result'] == 1) {
          alertSuccess();
          goToDashboard();
        } else {
          // Password reset failed
          // Handle the error accordingly
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Failed to reset password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        // Handle any HTTP error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to reset password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void goToDashboard() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MedicaDashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: width / 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Create_New_Password".tr,
                style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: width / 26, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                MedicaPngImg.newpassword,
                height: height / 6,
              ),
            ),
            SizedBox(height: height / 16),
            Text(
              "Create_Your_New_Password".tr,
              style: urbanistMedium.copyWith(fontSize: 18),
            ),
            SizedBox(height: height / 36),
            TextFormField(
              controller: emailController,
              cursorColor: Medicacolor.lightgrey,
              style: urbanistSemiBold.copyWith(fontSize: 16),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(MedicaPngImg.mail, height: height / 36),
                ),
                fillColor:
                themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                filled: true,
                hintText: "Email".tr,
                hintStyle:
                urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Medicacolor.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: height / 46),
            TextFormField(
              controller: codeController,
              cursorColor: Medicacolor.lightgrey,
              style: urbanistSemiBold.copyWith(fontSize: 16),
              // Remove the obscureText property for the verification code text field
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(MedicaPngImg.call, height: height / 36),
                ),
                fillColor:
                themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                filled: true,
                // Remove the suffixIcon property for the verification code text field
                hintText: "Verification_code".tr,
                hintStyle:
                urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Medicacolor.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: height / 46),
            TextFormField(
              controller: newPasswordController,
              cursorColor: Medicacolor.lightgrey,
              style: urbanistSemiBold.copyWith(fontSize: 16),
              obscureText: _obscureText1,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(MedicaPngImg.lock, height: height / 36),
                ),
                fillColor:
                themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText1
                        ? Icons.visibility_rounded
                        : Icons.visibility_off,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText1 = !_obscureText1;
                    });
                  },
                  color: Medicacolor.textgray,
                ),
                hintText: "New_password".tr,
                hintStyle:
                urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Medicacolor.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: height / 46),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Medicacolor.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(
                    color: Medicacolor.primary,
                    width: 2.5,
                  ),
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("Remember_me".tr,
                    style: urbanistSemiBold.copyWith(fontSize: 14)),
              ],
            ),
            const Spacer(),
            InkWell(
              splashColor: Medicacolor.transparent,
              highlightColor: Medicacolor.transparent,
              onTap: () {
                resetPassword();
              },
              child: Container(
                height: height / 15,
                width: width / 1,
                decoration: BoxDecoration(
                  color: Medicacolor.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: Text("Continue".tr,
                        style: urbanistBold.copyWith(fontSize: 16, color: Medicacolor.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  alertSuccess() async {
    return await showDialog(
      builder: (context) => AlertDialog(
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
                Text("Congratulations".tr,
                    style: urbanistBold.copyWith(fontSize: 24, color: Medicacolor.primary),
                    textAlign: TextAlign.center),
                SizedBox(height: height / 86),
                Text("Your_account_is_ready_to_use_You_will_be_redirected_to_the_Home_page_in_a_few_seconds".tr,
                    style: urbanistRegular.copyWith(fontSize: 16), textAlign: TextAlign.center),
                SizedBox(height: height / 46),
                Image.asset(MedicaPngImg.circular, height: height / 20),
              ],
            ),
          )
        ],
      ),
      context: context,
    );
  }
}
