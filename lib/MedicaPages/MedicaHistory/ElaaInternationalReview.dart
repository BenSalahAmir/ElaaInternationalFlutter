import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medica/models/Reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ElaaInternationalReview extends StatefulWidget {
  const ElaaInternationalReview({Key? key}) : super(key: key);

  @override
  State<ElaaInternationalReview> createState() => _MedicaReviewState();
}

class _MedicaReviewState extends State<ElaaInternationalReview> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: width / 1,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 26),
          child: Row(
            children: [
              Image.asset(MedicaPngImg.logowithoutback, height: height / 26),
              SizedBox(width: width / 16),
              Text(
                "Review".tr,
                style: urbanistBold.copyWith(
                  fontSize: 24,
                  color: themedata.isdark ? Medicacolor.white : Medicacolor.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "How would you rate our service?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildReviewQuestion("Was our staff friendly?"),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Submit review action
                  },
                  child: Text("Submit Review"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewQuestion(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _buildReviewButton(1),
            SizedBox(width: 10),
            _buildReviewButton(2),
            SizedBox(width: 10),
            _buildReviewButton(3),
            SizedBox(width: 10),
            _buildReviewButton(4),
            SizedBox(width: 10),
            _buildReviewButton(5),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewButton(int rating) {
    return InkWell(
      onTap: () {
        // Handle rating selection
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "$rating",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
