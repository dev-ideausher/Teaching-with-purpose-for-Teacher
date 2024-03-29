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

  static const String getTeacherDetail = "user/all-teachers?_id=";

  static const String updateTeacher = "user/updateTeacher";

  static const String createQuiz = "api/quiz/save";

  static const String getStudents = "user/all-students";

  static const String getStudentDeatils = "user/all-students?_id=";

  static const getSubjects = "api/subject/get";

  static const String results = "api/result/get";

  static const String addChapter = "api/chapter/save";

  static const String getChapter = "api/chapter/get?subjectId=";

  static const String getAnnouncements = "api/announcment/get";

  static const String getEvents = "api/event/get";
  
  static const String addQuestions = "api/question/save";

  static const String updateQuestions = "api/question/update";

  static const String getQuestions = "api/question/get?chapterId=";

  static const String addAssignment = "api/assignment/save";

  static const String getAssignments = "api/assignment/get";

  static const String updateAssignment = "api/assignment/update";

  static const String examSheet = "api/examdate/get";

  static const String timeTable = "api/timetable/get";

  static const String getClasses = "api/class/get";

  static const String addMarks = "api/mark/save";

  static const String ratings = "api/rating/save";

  static const String addResult = "api/result/save";

  static const String reviseQuestions = "api/revisedquestion/save";

  static const String markAttendence = "api/teacher/save";

  static const String addAssignmentFeedback = "api/assigmnentfeedback/save";

  static const String getAssignmentCompletion= "api/assigmentsubmit/assignment-performance";

  static const String getMarks= "api/result/get";

  static const String getCourseCompletion = "api/assigmentsubmit/percentage";

}
