import 'package:medica/models/QuestionAnswer.dart';

class Review {
  final String serviceName;
  final String userName;
  final List<QuestionAnswer> questions;
  final int score;

  Review({
    required this.serviceName,
    required this.userName,
    required this.questions,
    required this.score,
  });

  // Convert review object to JSON
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'userName': userName,
      'questions': questions.map((qa) => qa.toJson()).toList(),
      'score': score,
    };
  }
}
