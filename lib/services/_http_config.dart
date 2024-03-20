import 'package:dub_tralers/interceptors/jwt_interceptor.dart';
import 'package:dub_tralers/utils/env_util.dart';

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import 'dart:convert';

class Http {

  static JwtInterceptor interceptor = JwtInterceptor();
  
  static Map<String, String> getHeaders() {
    final Map<String, String> headers = {
      'X-CSRF-Token': '{{ csrftoken }}',
      'Content-Type': 'application/json'
    };
    return headers;
  }

  static Future<Response> requestGet(String path) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');

    final response = await interceptor.dio.get(
      '$baseUrl/$path', 
      options: Options(headers: getHeaders()),
    );

    return response;
  }

  //Post
  static Future<Response> requestPost(String path, dynamic obj) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');

    final response = await interceptor.dio.post(
      '$baseUrl/$path', 
      options: Options(headers: getHeaders()),
      data: jsonEncode(obj.toJson())
    );

    return response;
  }
  

  //Update
  static Future<Response> requestUpdate(String path, dynamic obj) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');

    final response = await interceptor.dio.put(
      '$baseUrl/$path', 
      options: Options(headers: getHeaders()),
      data: jsonEncode(obj.toJson())
    );

    return response;
  }

  //Delete
  static Future<Response> requestDelete(String path) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');

    final response = await interceptor.dio.delete(
      '$baseUrl/$path', 
      options: Options(headers: getHeaders()),
    );

    return response;
  }
}
