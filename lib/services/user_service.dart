import 'package:dub_tralers/models/user.dart';
import 'package:dub_tralers/types/user_type.dart';
import '_http_config.dart' as api;

class UserService {
  
  late String baseUrl = 'user';
  
  Future<List<UserT>> listAll() async {
    final response = await api.Http.requestGet('$baseUrl/');

    if (response.statusCode == 200) {
      return UserT.fromJsonList(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<UserT> getUser(int id) async {
    final response = await api.Http.requestGet('$baseUrl/$id/');

    if (response.statusCode == 200) {
      return UserT.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<List<UserT>> searchUser(String nickname) async {
    final response = await api.Http.requestPost('$baseUrl/searchUser/', User.fromArray([nickname]));

    if (response.statusCode == 200) {
      return UserT.fromJsonList(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<UserT> getAuthenticatedUser() async {
    try {
      final response = await api.Http.requestGet('$baseUrl/getUser/');

      if (response.statusCode == 200) {
            return UserT.fromJson(response.data);
      } 
      else {
        throw Exception('Failed to load User: ${response.statusCode}');
      }
    }
    catch(_) {
      throw Exception('Error at getAuthenticatedUser Response!');
    }    
  }

  Future<UserT> insert(User user) async {
    final response = await api.Http.requestPost('$baseUrl/', user);

    if (response.statusCode == 200) {
      return UserT.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<UserT> update(User user) async {
    final response = await api.Http.requestUpdate('$baseUrl/${user.getId()}/', user);

    if (response.statusCode == 200) {
      return UserT.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<String> delete(int id) async {
    final response = await api.Http.requestDelete('$baseUrl/$id/');

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }
}
