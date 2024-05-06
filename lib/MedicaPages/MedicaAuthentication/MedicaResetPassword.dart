import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:http/http.dart' as http;
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_newpassword.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_otpverify.dart';

class MedicaResetPassword extends StatefulWidget {
  const MedicaResetPassword({Key? key}) : super(key: key);

  @override
  State<MedicaResetPassword> createState() => _MedicaResetPasswordState();
}

class _MedicaResetPasswordState extends State<MedicaResetPassword> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  TextEditingController emailController = TextEditingController();
  bool emailValid = true;
  bool isLoading = false;

  Future<void> resetPassword() async {
    setState(() {
      isLoading = true;
    });

    final url = 'http://10.0.2.2:9098/api/auth/checkEmail';
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final body = jsonEncode({
      'email': emailController.text,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['result'] == 1) {
          // Email exists, navigate to OTP verification screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicaNewPassword(),
            ),
          );
        } else {
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
        throw Exception('Failed to reset password');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error: $error');
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Réinitialiser le mot de passe".tr,
                style: urbanistBold.copyWith(fontSize: 24)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 26, vertical: height / 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  MedicaPngImg.forget2,
                  height: height / 3,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: height / 50),
              Text("Veuillez entrer votre email pour réinitialiser votre mot de passe".tr,
                  style: urbanistRegular.copyWith(fontSize: 14)),
              SizedBox(height: height / 50),
              TextFormField(
                controller: emailController,
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                decoration: InputDecoration(
                  fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                  filled: true,
                  hintText: "Email".tr,
                  hintStyle: urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
                  errorText: emailValid ? null : "Invalid email",
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
                onChanged: (value) {
                  setState(() {
                    emailValid = true;
                  });
                },
              ),
              SizedBox(height: height / 50),
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
                    borderRadius: BorderRadius.circular(50),
                    color: Medicacolor.primary,
                  ),
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : Text("réinitialiser le mot de passe".tr,
                        style: urbanistSemiBold.copyWith(fontSize: 16, color: Medicacolor.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
