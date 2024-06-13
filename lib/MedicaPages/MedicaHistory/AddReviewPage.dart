import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/models/QuestionAnswer.dart';
import 'package:medica/models/Review.dart';
import 'package:http/http.dart' as http;

import '../../MedicaGlobal/medica_color.dart';
import '../../MedicaGlobal/medica_fonts.dart';
import '../../MedicaGlobal/medica_images.dart';
import '../../MedicaThmes/medica_themecontroller.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({Key? key}) : super(key: key);

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
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

  List<QuestionAnswer> questionAnswers = [
    QuestionAnswer(
      question: "Comment évaluer notre service ?",
      options: ["Très satisfait (10)", "Satisfait (5)", "Non Satisfait(0)"],
      answer: "",
      score: 0,
    ),
    QuestionAnswer(
      question: "Comment evaluer l'intervention de notre prestataire ?",
      options: ["Efficace (10)","Non efficace (0)"],
      answer: "",
      score: 0,
    ),
    QuestionAnswer(
      question: "Les délais d'intervention sont-ils respectés ?",
      options: ["Avant rendez-vous (10)", "Au rendez-vous(5)","Apres rendez-vous (0)"],
      answer: "",
      score: 0,
    ),
    QuestionAnswer(
      question: "Comment evaluer vous la communication avec le pleateaux d'assitance ?",
      options: ["Excelente(10)","Moyenne (5)","Mediocre (0)"],
      answer: "",
      score: 0,
    )
  ];


  void _saveReview() async {
    // Construct review object
    Review review = Review(
      serviceName: "Ambulance",
      userName: "amirBs",
      questions: questionAnswers,
      score: questionAnswers.map((qa) => qa.score).reduce((a, b) => a + b) ~/ questionAnswers.length,
    );

    var url = Uri.parse('http://10.0.2.2:9098/api/reviews');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(review.toJson()),
    );

    if (response.statusCode == 200) {
      alertSuccess();
      goToDashboard();

      print('Review saved successfully');
    } else {
      print('Error saving review: ${response.statusCode}');
    }
  }

  void goToDashboard() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MedicaDashboard()),
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
                Text("Merci ".tr,
                    style: urbanistBold.copyWith(fontSize: 24, color: Medicacolor.primary),
                    textAlign: TextAlign.center),
                SizedBox(height: height / 86),
                Text("Merci pour votre avis sur notre service. Nous apprécions votre retour et nous nous efforçons d'améliorer constamment notre service. Vous serez redirigé vers la page précédente dans quelques secondes.".tr,
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



  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: width / 10,
        title: Row(
          children: [
            Image.asset(MedicaPngImg.logowithoutback, height: height / 26),
            SizedBox(width: width / 16),
            Text("Ajouter Avis".tr, style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.search, height: height / 36, color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            SizedBox(width: width / 26),
            Image.asset(MedicaPngImg.moreoption, height: height / 36, color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
                shrinkWrap: true,
                itemCount: questionAnswers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(questionAnswers[index].question, style: urbanistBold.copyWith(fontSize: 18)),
                        SizedBox(height: height / 86),
                        Wrap(
                          spacing: 8.0,
                          children: [
                            for (final option in questionAnswers[index].options)
                              ChoiceChip(
                                label: Text(option),
                                selected: questionAnswers[index].answer == option,
                                onSelected: (selected) {
                                  setState(() {
                                    questionAnswers[index].answer = option;
                                    // Update score based on selected option
                                    final scoreString = option.split('(')[1].split(')')[0];
                                    questionAnswers[index].score = double.parse(scoreString);
                                  });
                                },
                                selectedColor: Medicacolor.primary, // Set selected color
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: height / 80), // Add spacing before the button
              ElevatedButton(
                onPressed: () {
                  // Handle saving the review here
                  _saveReview();
                },
                child: Center(
                  child: Text(
                    "Enregistrer l'avis".tr, // Use translation for "Enregistrer l'avis"
                    style: urbanistBold.copyWith(fontSize: 16, color: Medicacolor.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Medicacolor.primary, // Set background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set rounded corners
                  ),
                  fixedSize: Size(width * 0.7, 50), // Adjust width and height as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}