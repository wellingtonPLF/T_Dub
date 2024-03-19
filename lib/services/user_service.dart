import 'dart:convert';
import 'package:dub_tralers/models/user.dart';
import '_http_config.dart' as api;

class UserService {
  
  late String baseUrl = 'user';
  
  Future<List<User>> listAll() async {
    final response = await api.Http.requestGet('$baseUrl/');

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return User.fromJsonList(jsonResponse);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> getUser(int id) async {
    final response = await api.Http.requestGet('$baseUrl/$id/');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> searchUser(String nickname) async {
    final response = await api.Http.requestPost('$baseUrl/searchUser/', nickname);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> getAuthenticatedUser(String nickname) async {
    final response = await api.Http.requestGet('$baseUrl/getUser/');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> insert(User user) async {
    final response = await api.Http.requestPost('$baseUrl/', user);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> update(User user) async {
    final response = await api.Http.requestUpdate('$baseUrl/${user.getId()}/', user);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> delete(int id) async {
    final response = await api.Http.requestDelete('$baseUrl/$id/');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }
}
