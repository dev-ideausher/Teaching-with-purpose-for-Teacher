class QuizQuestion {
  String questionText;
  List<String> options;
  int correctAnswerIndex;
  int marks;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.marks,
  });
    Map<String, dynamic> toJson() {
    return {
      "questionText": questionText,
      "answer": correctAnswerIndex,
      "points": marks,
      "options": options,
    };
  }
}