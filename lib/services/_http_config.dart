import 'package:dub_tralers/models/trailer.dart';
import 'package:dub_tralers/utils/env_util.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'dart:convert';

class Http {
  
  static Map<String, String> getHeaders() {
    final Map<String, String> headers = {
      'X-CSRF-Token': '{{ csrftoken }}',
      'Content-Type': 'application/json'
    };
    return headers;
  }

  static Future<http.Response> requestGet(String path) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');
    final Uri url = Uri.parse('$baseUrl/$path');

    final response = await http.get(
      url, 
      headers: getHeaders()
    );

    return response;
  }

  //Post
  static Future<http.Response> requestPost(String path, Trailer trailer) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');
    final Uri url = Uri.parse('$baseUrl/$path');

    final response = await http.post(
      url, 
      headers: getHeaders(),
      body: jsonEncode(trailer.toJson())
    );

    return response;
  }
  

  //Update
  static Future<http.Response> requestUpdate(String path, Trailer trailer) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');
    final Uri url = Uri.parse('$baseUrl/$path');

    final response = await http.put(
      url, 
      headers: getHeaders(),
      body: jsonEncode(trailer.toJson())
    );

    return response;
  }

  //Delete
  static Future<http.Response> requestDelete(String path) async {
    final String baseUrl = await EnvUtil.getEnvParam('BASE_URL');
    final Uri url = Uri.parse('$baseUrl/$path');

    final response = await http.delete(
      url, 
      headers: getHeaders()
    );

    return response;
  }
}
