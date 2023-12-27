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

  static Future<Response> createQuiz({required dynamic body}) async => 
          await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.createQuiz, data: jsonEncode(body)); 

  static Future<Response> createChapter({required dynamic body}) async => 
          await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.createChapter, data: jsonEncode(body)); 

  static Future<Response> createQuestion({required dynamic body}) async => 
          await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.createQuestions, data: jsonEncode(body)); 

  static Future<Response> createAssignment({required dynamic body}) async => 
          await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.addAssignment, data: jsonEncode(body)); 



///Get API 

static Future<Response> getAllStudent() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getStudents);  

static Future<Response> getResults() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(Endpoints.results);  

static Future<Response> getChapter() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getChapter);  

static Future<Response> getSubjects() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getSubjects);  

static Future<Response> getAnnouncements() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getAnnouncements);  

static Future<Response> getEvents() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getEvents);  

static Future<Response> getQuestions() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(Endpoints.getQuestions);  




///Patch API


 
}
