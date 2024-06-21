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

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) {
    return QuestionAnswer(
      question: json['question'],
      options: List<String>.from(json['options']), // Parse options from JSON
      answer: json['answer'] ?? "",
      score: json['score'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options, // Include options in the JSON
      'answer': answer,
      'score': score,
    };
  }
}
