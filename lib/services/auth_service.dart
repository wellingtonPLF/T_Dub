import 'package:dub_tralers/models/auth.dart';
import '_http_config.dart' as api;

class AuthService {
  
  late String baseUrl = 'auth';
  
  Future<String> authentication(Auth auth) async {
    final response = await api.Http.requestPost('$baseUrl/authentication/', auth);

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception(response.data['detail']);
    }
  }

  Future<bool> isLoggedIn() async {
    final response = await api.Http.requestGet('$baseUrl/isLoggedIn/');

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception('Failed to load Auth: ${response.statusCode}');
    }
  }

  Future<Auth> authInsert(Auth auth) async {
    final response = await api.Http.requestPost('$baseUrl/', auth);

    if (response.statusCode == 200) {
      return Auth.fromJson(response.data);
    } 
    else {
      throw Exception(response.data);
    }
  }

  Future<String> authUpdate(Auth auth) async {
    final response = await api.Http.requestUpdate('$baseUrl/${auth.getId()}/', auth);

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception(response.data['detail']);
    }
  }

  Future<String> acceptAuth(Auth auth) async {
    final response = await api.Http.requestPost('$baseUrl/acceptAuth/', auth);

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception(response.data['detail']);
    }
  }

  Future<bool> limitSize() async {
    final response = await api.Http.requestGet('$baseUrl/limitSize/');

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception('Failed to load LimitSize: ${response.statusCode}');
    }
  }

  Future<String> testando() async {
    final response = await api.Http.easyGet('$baseUrl/testando/');

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception("Testando Error");
    }
  }

  Future<String> refreshToken() async {
    final response = await api.Http.easyGet('$baseUrl/refresh/');

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception(response.data['detail']);
    }
  }

  Future<String> logOut() async {
    final response = await api.Http.easyGet('$baseUrl/logout/');

    if (response.statusCode == 200) {
      return response.data;
    } 
    else {
      throw Exception(response.data['detail']);
    }
  }
}
