  
class Role {
  int? _id;
  String? _roleName;

  Role(int id, String roleName) {
    _id = id;
    _roleName = roleName;
  }

  Role.empty();

  Role.nullObject() {
     _id = 0;
    _roleName = '';
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      json['id'],
      json['roleName'],
    );
  }

  static List<Role> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Role.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {};
    if (_id != null) jsonMap['id'] = _id;
    if (_roleName != null) jsonMap['roleName'] = _roleName;
    return jsonMap;
  }

  static List<Map<String, dynamic>> listToJson(List<Role> listObj) {
    return listObj.map((json) => json.toJson()).toList();
  }

  int? getId() {
    return _id;
  }

  String? getRoleName() {
    return _roleName;
  }

  void setId(int id) {
    _id = id;
  }

  void setRoleName(String roleName) {
    _roleName = roleName;
  }

  @override
  String toString() {
    return """{
      id: $_id, 
      roleName: $_roleName }""";
  }
}