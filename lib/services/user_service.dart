import 'package:dub_tralers/models/user.dart';
import 'package:dub_tralers/types/user_type.dart';
import '_http_config.dart' as api;

//Testar
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

  Future<dynamic> searchUser(String nickname) async {
    User userNick = User.fromArray([nickname]);
    final response = await api.Http.requestPost('$baseUrl/searchUser/', userNick);

    if (response.statusCode == 200) {
      return response.data;//User.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> getAuthenticatedUser() async {
    final response = await api.Http.requestGet('$baseUrl/getUser/');

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> insert(User user) async {
    final response = await api.Http.requestPost('$baseUrl/', user);

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> update(User user) async {
    final response = await api.Http.requestUpdate('$baseUrl/${user.getId()}/', user);

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }

  Future<User> delete(int id) async {
    final response = await api.Http.requestDelete('$baseUrl/$id/');

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load User: ${response.statusCode}');
    }
  }
}
