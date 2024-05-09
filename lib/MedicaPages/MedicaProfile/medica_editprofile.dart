import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../MedicaGlobal/medica_images.dart';
import 'package:http/http.dart' as http;

class MedicaEditprofile extends StatefulWidget {
  const MedicaEditprofile({Key? key}) : super(key: key);

  @override
  State<MedicaEditprofile> createState() => _MedicaEditprofileState();
}



class _MedicaEditprofileState extends State<MedicaEditprofile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  bool _obscureText = true;
  bool isChecked = false;
  bool _isLoading = false;

  String selectedRegion = ''; // Initially no region selected

  List<String> tunisianRegions = [
    'Ariana',
    'Béja',
    'Ben Arous',
    'Bizerte',
    'El Kef',
    'Gabes',
    'Gafsa',
    'Jendouba',
    'Kairouan',
    'Kesserine',
    'Kebili',
    'Mahdia',
    'Manouba',
    'Medenine',
    'Monastir',
    'Nabeul',
    'Sfax',
    'Sidi Bouzid',
    'Siliana',
    'Sousse',
    'Tataouine',
    'Tozeur',
    'Tunis',
    'Zaghouan',
  ];

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _numeroTelephone = TextEditingController();
  final _region = TextEditingController();
  final _id = TextEditingController();

  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final themedata = Get.put(MedicaThemecontroler());

  String? username;
  String? id;
  String? Adressemail;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      id = prefs.getString('userId');
      Adressemail = prefs.getString('email');

      _usernameController.text = username ?? '';
      _emailController.text = Adressemail ?? '';
      _id.text= id ?? '';

      print("test load user data "+ _id.text+_emailController.text+_usernameController.text);



      // Populate other fields if needed
    });
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



  void _updateProfile() async {
    print(_id.text+_emailController.text+_usernameController.text);



    setState(() {
      _isLoading = true;
    });

    // Prepare the updated user data
    User updatedUser = User(
      id: _id.text,
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text, // Don't send password when updating profile
      isverified: 1, // Set default value, it might not be updated
      userCode: '', // Set default value, it might not be updated
      verificationToken: '', // Set default value, it might not be updated
      region: _region.text, // Set default value, it might not be updated
      numeroTelephone: int.parse(_numeroTelephone.text),
      roles: [], // Set default value, it might not be updated
    );

    try {
      final url = Uri.parse('http://10.0.2.2:9098/api/auth/updateuser');
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body: jsonEncode(<String, dynamic>{
          'id':_id.text,
          'username': _usernameController.text,
          'password': _passwordController.text,
          'email': _emailController.text,
          'region':_region.text,
          'numeroTelephone':int.parse(_numeroTelephone.text),
        }),
      );
      print("donneeeeeeeeeeee "+_id.text+_emailController.text+_usernameController.text);


      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await _showDialog('Success', responseData['message']);
        // Handle success response, you might want to navigate to another screen or update UI accordingly
      } else {
        await _showDialog('Error', responseData['message']);
        // Handle error response
      }
    } catch (e) {
      await _showDialog('Error', 'Failed to update user');
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
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          children: [
            Text("Edit_Profile".tr,style: urbanistBold.copyWith(fontSize: 22 )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "nom d'utilisateur ".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  //  prefixIcon:Icon(Icons.search_rounded,size: height/36,color: Medicacolor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Medicacolor.primary)
                  ),
                ),
              ),
              SizedBox(height: height/46,),


              TextField(
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
                  hintText: "mot de passe".tr,
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
              SizedBox(height: height/46,),


              TextField(
                controller: _emailController,
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Email".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  suffixIcon:Icon(Icons.email_outlined,size: height/36,color: Medicacolor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Medicacolor.primary)
                  ),
                ),
              ),
              SizedBox(height: height/46,),


              TextField(
                controller: _region,

                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:Medicacolor.textgray,),
                  hintText: "Choisissez le pays".tr,
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  suffixIcon:Icon(Icons.arrow_drop_down_sharp,size: height/36,color: Medicacolor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Medicacolor.primary)
                  ),
                ),
              ),
              SizedBox(height: height/46,),
              IntlPhoneField(
                controller: _numeroTelephone,

                flagsButtonPadding: const EdgeInsets.all(8),
                dropdownIconPosition: IconPosition.trailing,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                keyboardType: TextInputType.number,
                disableLengthCheck: true,
                dropdownTextStyle: urbanistSemiBold.copyWith(fontSize: 16,color: themedata.isdark?Medicacolor.white:Medicacolor.textgray,),
                decoration: InputDecoration(
                  hintText: "00000000",
                  fillColor: themedata.isdark?Medicacolor.darkblack:Medicacolor.container,
                  filled: true,
                  hintStyle: urbanistRegular,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Medicacolor.primary)
                  ),
                ),
                initialCountryCode: 'Un',

                onChanged: (phone) {
                },
              ),
              SizedBox(height: height/46,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
        child: InkWell(
          splashColor:Medicacolor.transparent,
          highlightColor:Medicacolor.transparent,
          onTap: _updateProfile, // Call the update method when tapped
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Medicacolor.primary,
            ),
            child: Center(
              child: _isLoading
                  ? CircularProgressIndicator() // Show loading indicator while updating
                  : Text("Modifier Profil".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),

    );
  }
}
