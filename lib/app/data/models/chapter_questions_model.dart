class ChapterQuestion {
  String questionText;
  List<String> options;
  String solution;

  ChapterQuestion({
    required this.questionText,
    required this.options,
    required this.solution,
  });

  Map<String, dynamic> toJson() {
    return {
      "questionText": questionText,
      "options": options,
      "solution": solution,
    };
  }
}