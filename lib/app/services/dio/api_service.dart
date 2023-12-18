import 'dart:convert';
import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
    APIManager._();
  ///Post API

  static Future<Response> login() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.login);  

  static Future<Response> createQuiz({required dynamic body}) async => 
          await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.createQuiz, data: jsonEncode(body)); 




///Get API 

static Future<Response> getAllStudent() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getStudents);  

static Future<Response> getResults() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(Endpoints.results);  
}
