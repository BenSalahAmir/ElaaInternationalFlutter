import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_fillprofile.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_login.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:http/http.dart' as http;


class MedicaRegister extends StatefulWidget {
  const MedicaRegister({Key? key}) : super(key: key);

  @override
  State<MedicaRegister> createState() => _MedicaRegisterState();
}

class _MedicaRegisterState extends State<MedicaRegister> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  bool _obscureText = true;
  bool isChecked = false;
  bool _isLoading = false;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _refContratController = TextEditingController();



  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  final themedata = Get.put(MedicaThemecontroler());
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


  Future<void> _showDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<void> _registerUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse('http://10.0.2.2:9098/api/auth/signup');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': _usernameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'roles': ['admin'],
          'refContrat': _refContratController.text,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await _showDialog('Success', responseData['message']);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MedicaLogin(),
          ),
        );
        // Do not navigate to MedicaLogin on success
      } else {
        await _showDialog('Error', responseData['message']);
        // Stay on the MedicaRegister page on error
      }
    } catch (e) {
      await _showDialog('Error', 'Failed to register user');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              SvgPicture.asset(MedicaSvgImg.logo, height: height / 8),
              SizedBox(height: height / 26),
              Text("Create_New_Account".tr, style: urbanistBold.copyWith(fontSize: 32)),
              SizedBox(height: height / 26),
              TextFormField(
                controller: _emailController,

                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(MedicaPngImg.mail, height: height / 46,),
                  ),
                  fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                  filled: true,
                  hintText: "Email".tr,
                  hintStyle: urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
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
                controller: _passwordController,

                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                obscureText: _obscureText,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(MedicaPngImg.lock, height: height / 40,),
                  ),
                  fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_rounded : Icons.visibility_off,
                      size: 20,
                    ),
                    onPressed: _togglePasswordStatus,
                    color: Medicacolor.textgray,
                  ),
                  hintText: "password".tr,
                  hintStyle: urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
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
                controller: _usernameController,
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(MedicaPngImg.user, height: height / 46,), // Assuming you have a user icon
                  ),
                  fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                  filled: true,
                  hintText: "Username".tr,
                  hintStyle: urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
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
              SizedBox(height: height / 96),
              TextFormField(
                controller: _refContratController,
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Icon(Icons.confirmation_number, color: Medicacolor.textgray, size: height / 46,),
                  ),
                  fillColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                  filled: true,
                  hintText: "Ref_Contrat".tr,
                  hintStyle: urbanistRegular.copyWith(fontSize: 14, color: Medicacolor.textgray),
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
              SizedBox(height: height / 96),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Medicacolor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
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
                  Text("Remember_me".tr, style: urbanistSemiBold.copyWith(fontSize: 14)),
                ],
              ),
              SizedBox(height: height / 96),
              InkWell(
                onTap: () async {
                  setState(() {
                    _isLoading = true; // Set loading state to true
                  });

                  await _registerUser(); // Register the user

                  setState(() {
                    _isLoading = false; // Set loading state to false after registration
                  });

                  // Navigate to login page after registration
                },
                splashColor: Medicacolor.transparent,
                highlightColor: Medicacolor.transparent,
                child: Container(
                  height: height / 15,
                  width: width / 1,
                  decoration: BoxDecoration(
                    color: Medicacolor.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: _isLoading
                      ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Medicacolor.white),
                    ),
                  )
                      : Center(
                    child: Text(
                      "Sign_up".tr,
                      style: urbanistBold.copyWith(fontSize: 16, color: Medicacolor.white),
                    ),
                  ),
                ),
              ),



              SizedBox(height: height / 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height / 500,
                    width: width / 4,
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray,
                  ),
                  SizedBox(width: width / 26),
                  Text("or_continue_with".tr, style: urbanistSemiBold.copyWith(fontSize: 15, color: Medicacolor.textgray)),
                  SizedBox(width: width / 26),
                  Container(
                    height: height / 500,
                    width: width / 4,
                    color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray,
                  ),
                ],
              ),
              SizedBox(height: height / 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height / 15,
                    width: width / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(MedicaPngImg.facebook, height: height / 30),
                    ),
                  ),
                  SizedBox(width: width / 26),
                  Container(
                    height: height / 15,
                    width: width / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(MedicaPngImg.google,height: height/30),
                    ),
                  ),
                  SizedBox(width: width/26),
                  Container(
                    height: height/15,
                    width: width/5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(MedicaPngImg.apple,height: height/30,color: themedata.isdark?Medicacolor.white:Medicacolor.black,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already_have_an_account'.tr,
                      style: urbanistRegular.copyWith(
                          fontSize: 14, color: Medicacolor.textgray)),
                  SizedBox(width: width/96),
                  InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      await _registerUser(); // Register the user

                      setState(() {
                        _isLoading = false;
                      });

                      // Check if registration was successful
                      if (!_isLoading) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicaLogin();
                            },
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Sign_in'.tr,
                      style: urbanistSemiBold.copyWith(fontSize: 14, color: Medicacolor.primary),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
