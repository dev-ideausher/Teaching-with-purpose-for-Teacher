class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://learning-with-purpose-backend.vercel.app/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String login = "user/login";

  static const String uploadFile = "file-upload/file";

  static const String createQuiz = "api/quiz/save";

  static const String getStudents = "user/all-students";

  static const getSubjects = "api/subject/get";

  static const String results = "api/result/get";

  static const String createChapter = "api/chapter/save";

  static const String getChapter = "api/chapter/get";

  static const String getAnnouncements = "api/announcment/get";

  static const String getEvents = "api/event/get";
  
  static const String createQuestions = "api/question/save";

  static const String updateQuestions = "api/question/update";

  static const String getQuestions = "api/question/get";

  static const String addAssignment = "api/assignment/save";

}
