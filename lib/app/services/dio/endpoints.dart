class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://learning-with-purpose-backend.vercel.app/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String login = "user/login";

  static const String createQuiz = "api/quiz/save";

  static const String getStudents = "user/all-students";

  static const String results = "api/result/get";

  static const String createChapter = "api/chapter/save";
}
