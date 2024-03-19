  
import 'package:dub_tralers/models/role.dart';

class Auth {
  int? _id;
  String? _email;
  String? _username;
  String? _password;
  List<Role>? _roles = [Role(1, "ROLE_USER")];

  Auth(int id, String email, String username, String password, List<Role> roles) {
    _id = id;
    _email = email;
    _username = username;
    _password = password;
    _roles = roles;
  }

  Auth.empty();

  Auth.nullObject() {
     _id = 0;
    _email = '';
    _username = '';
    _password = '';
    _roles = [];
  }

  Auth.fromArray(List<dynamic> myarray) {
    if (myarray.length == 3) {
      _email = myarray[0] as String?;
      _username = myarray[1] as String?;
      _password = myarray[2] as String?;
    }
    if (myarray.length == 2) {
      _username = myarray[0] as String?;
      _password = myarray[1] as String?;
    }
  }

  factory Auth.fromJson(Map<String, dynamic> json) {
    Auth auth = Auth.empty();
    auth.setId(json['id']);
    auth.setUserName(json['username']);
    return auth;
  }

  static List<Auth> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Auth.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {};
    if (_id != null) jsonMap['id'] = _id;
    if (_email != null) jsonMap['email'] = _email;
    if (_username != null) jsonMap['username'] = _username;
    if (_password != null) jsonMap['password'] = _password;
    if (_roles != null) jsonMap['roles'] = Role.listToJson(_roles!);
    return jsonMap;
  }

  int? getId() {
    return _id;
  }

  String? getUserName() {
    return _username;
  }

  String? getEmail() {
    return _email;
  }

  String? getPassword() {
    return _password;
  }

  void setId(int id) {
    _id = id;
  }

  void setUserName(String username) {
    _username = username;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  @override
  String toString() {
    return """
    {
      id: $_id, 
      email: $_email, 
      username: $_username, 
      password: $_password, 
      roles: $_roles
    }
    \n""";
  }
}