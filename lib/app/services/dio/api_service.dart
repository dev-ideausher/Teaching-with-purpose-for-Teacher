import 'dart:convert';
import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
    APIManager._();
  ///Post API

  static Future<Response> login() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.login);  

  static Future<Response> fileUpload({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.uploadFile, data: body, options: Options(headers: {'Content-Type': 'multipart/form-data'}));

  static Future<Response> createQuiz({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.createQuiz, data: jsonEncode(body)); 

  static Future<Response> createChapter({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.addChapter, data: jsonEncode(body)); 

  static Future<Response> createQuestion({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.addQuestions, data: jsonEncode(body)); 

  static Future<Response> createAssignment({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.addAssignment, data: jsonEncode(body)); 

  static Future<Response> addMarks({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.addMarks, data: jsonEncode(body)); 

  static Future<Response> giveRating({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.ratings, data: jsonEncode(body));

  static Future<Response> addResult({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.addResult, data: jsonEncode(body));

 static Future<Response> addReviseQuestions({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.reviseQuestions, data: jsonEncode(body));

///Get API 

static Future<Response> getAllStudent() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getStudents);  

static Future<Response> getStudentDetail({required String id}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getStudentDeatils + id); 

static Future<Response> getuser({required String id}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getTeacherDetail + id);  

static Future<Response> getResults() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(Endpoints.results);  

static Future<Response> getChapter({required String subjectId}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getChapter + subjectId);  

static Future<Response> getSubjects() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getSubjects);  

static Future<Response> getAnnouncements() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getAnnouncements);  

static Future<Response> getEvents() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getEvents);  

static Future<Response> getQuestion({required String chapterId}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getQuestions + chapterId);  

static Future<Response> getExamSheet() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.examSheet);  

static Future<Response> getClasses() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getClasses);  

static Future<Response> getClassSchedule() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.timeTable);  

static Future<Response> getAssignments() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getAssignments); 



///Patch API

  static Future<Response> updateUser({required String id,required dynamic body}) async =>await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch("${Endpoints.updateTeacher}/$id",data: jsonEncode(body));

  static Future<Response> updateAssignment({required String id,required dynamic body}) async =>await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch("${Endpoints.updateAssignment}/$id",data: jsonEncode(body));


 
}
