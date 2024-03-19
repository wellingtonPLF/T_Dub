import 'dart:convert';
import 'package:dub_tralers/models/auth.dart';
import '_http_config.dart' as api;

class AuthService {
  
  late String baseUrl = 'auth';
  
  Future<String> authentication(Auth auth) async {
    final response = await api.Http.requestPost('$baseUrl/authentication/', auth);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } 
    else {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse['detail']);
    }
  }

  Future<bool> isLoggedIn() async {
    final response = await api.Http.requestGet('$baseUrl/isLoggedIn/');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } 
    else {
      throw Exception('Failed to load Auth: ${response.statusCode}');
    }
  }

  Future<Auth> authInsert(Auth auth) async {
    final response = await api.Http.requestPost('$baseUrl/', auth);
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (response.statusCode == 200) {  
      return Auth.fromJson(jsonResponse);
    } 
    else {
      throw Exception(jsonResponse);
    }
  }

  Future<Auth> authUpdate(Auth auth) async {
    final response = await api.Http.requestUpdate('$baseUrl/${auth.getId()}/', auth);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } 
    else {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse['detail']);
    }
  }

  Future<String> acceptAuth(Auth auth) async {
    final response = await api.Http.requestPost('$baseUrl/acceptAuth/', auth);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } 
    else {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse['detail']);
    }
  }

  Future<bool> limitSize() async {
    final response = await api.Http.requestGet('$baseUrl/limitSize/');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } 
    else {
      throw Exception('Failed to load LimitSize: ${response.statusCode}');
    }
  }

  Future<String> refreshToken() async {
    final response = await api.Http.requestGet('$baseUrl/refresh/');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } 
    else {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse['detail']);
    }
  }

  Future<String> logOut() async {
    final response = await api.Http.requestGet('$baseUrl/logout/');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } 
    else {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse['detail']);
    }
  }
}
