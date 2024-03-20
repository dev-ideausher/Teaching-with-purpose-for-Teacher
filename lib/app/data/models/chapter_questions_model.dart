class ChapterQuestion {
  String questionText;
  List<String> options;
  int? answer; 
  String solution;

  ChapterQuestion({
    required this.questionText,
    required this.options,
    this.answer, 
    required this.solution,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "questionText": questionText,
      "options": options,
      "solution": solution,
    };
    if (answer != null) {
      json["answer"] = answer;
    }

    return json;
  }
}
