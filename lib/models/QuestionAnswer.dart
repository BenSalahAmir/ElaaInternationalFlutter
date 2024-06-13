class QuestionAnswer {
  final String question;
  final List<String> options; // Define options as a List of String
  String answer;
  double score;

  QuestionAnswer({
    required this.question,
    required this.options, // Make options required when creating a QuestionAnswer
    this.answer = "",
    this.score = 0.0,
  });



  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
      'score': score,

    };
  }
}
