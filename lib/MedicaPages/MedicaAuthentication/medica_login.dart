import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_forgotpassword.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_register.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:http/http.dart' as http;


class MedicaLogin extends StatefulWidget {
  const MedicaLogin({Key? key}) : super(key: key);

  @override
  State<MedicaLogin> createState() => _MedicaLoginState();
}

class _MedicaLoginState extends State<MedicaLogin> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  bool _obscureText = true;
  bool isChecked = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



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




  Future<void> _authenticateUser() async {
    final String apiUrl = 'http://10.0.2.2:9098/api/auth/signin';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully authenticated
      Map<String, dynamic> data = jsonDecode(response.body);
      // Handle the response data here
      print(data);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MedicaDashboard(),
        ),
      );
    } else {
      // Failed to authenticate
      print('Failed to authenticate');
      // Handle error here
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
              SvgPicture.asset(MedicaSvgImg.logo,height: height/8),
              SizedBox(height: height/26),
              Text("Login_to_Your_Account".tr,style: urbanistBold.copyWith(fontSize: 32)),
              SizedBox(height: height/26),
              TextFormField(

                controller: emailController,

                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(MedicaPngImg.mail,height: height/46,),
                    ),
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    hintText: "Email".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: height/46),
              TextFormField(

                controller: passwordController,
                cursorColor: Medicacolor.lightgrey,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(MedicaPngImg.lock,height: height/40,),
                    ),
                    fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_rounded
                            : Icons.visibility_off,
                        size: 20,
                      ),
                      onPressed: _togglePasswordStatus,
                      color: Medicacolor.textgray,
                    ),
                    hintText: "password".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Medicacolor.primary),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
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
                      setState(
                            () {
                          isChecked = value!;
                        },
                      );
                    },
                  ),
                  Text("Remember_me".tr,style: urbanistSemiBold.copyWith(fontSize: 14)),
                ],
              ),
              Container(
                height: height / 15,
                width: width / 1,
                decoration: BoxDecoration(
                  color: Medicacolor.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () async {
                    await _authenticateUser();  // Call the authenticate method
                  },
                  child: Center(
                    child: Text(
                      "Sign_in".tr,
                      style: urbanistBold.copyWith(fontSize: 16, color: Medicacolor.white),
                    ),
                  ),
                ),
              ),


              SizedBox(height: height/96),
              TextButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return const MedicaForgotPassword();
                 },));
              }, child: Text("Forgot_the_password".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color: Medicacolor.primary))),
              SizedBox(height: height/46),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: height / 500,
                      width: width / 4,
                      color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray),
                  SizedBox(width: width / 26),
                  Text(
                    "or_continue_with".tr,
                    style: urbanistSemiBold.copyWith(
                        fontSize: 15,color: Medicacolor.textgray),
                  ),
                  SizedBox(width: width / 26),
                  Container(
                      height: height / 500,
                      width: width / 4,
                      color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.bggray),
                ],
              ),
              SizedBox(height: height/26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height/15,
                    width: width/5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: themedata.isdark ? Medicacolor.darkblack :  Medicacolor.bggray)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(MedicaPngImg.facebook,height: height/30),
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
                  Text('Dont_have_an_account'.tr,
                      style: urbanistRegular.copyWith(
                          fontSize: 14, color: Medicacolor.textgray)),
                  SizedBox(width: width/96),
                  InkWell(
                    splashColor: Medicacolor.transparent,
                    highlightColor: Medicacolor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const MedicaRegister();
                        },
                      ));
                    },
                    child: Text('Sign_up'.tr,
                        style: urbanistSemiBold.copyWith(fontSize: 14, color: Medicacolor.primary)),
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
