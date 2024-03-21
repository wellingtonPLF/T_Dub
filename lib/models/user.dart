
class User {
  int? _id;
  String? _nickname;
  String? _bornDate;
  int? _auth;
  List<int>? _trailers;

  User(int id, String nickname, String bornDate, int auth, List<int> trailers) {
    _id = id;
    _nickname = nickname;
    _bornDate = bornDate;
    _auth = auth;
    _trailers = trailers;
  }

  User.empty();

  User.nullObject() {
    _id = 0;
    _nickname = '';
    _bornDate = '';
    _auth = 0;
    _trailers = [];
  }

  User.fromArray(List<dynamic> myarray) {
    if (myarray.length == 1) {
      _nickname = myarray[0] as String?;
    }
    if (myarray.length == 2) {
      _nickname = myarray[0] as String?;
      _bornDate = myarray[1] as String?;
    }
    if (myarray.length == 4) {
      _nickname = myarray[0] as String?;
      _bornDate = myarray[1] as String?;
      _auth = myarray[2] as int?;
      _trailers = myarray[3] as List<int>?;
    }
  }

  factory User.fromJson(Map<String, dynamic> json) {
    // List<dynamic> result = [];
    // for (var entry in json.entries) {
    //   result.add(json[entry.key]);
    // }
    return User.fromArray([
      json['id'],
      json['nickname'],
      json['bornDate'],
      json['auth_id'],
      json['trailers']]
    );
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {};
    if (_id != null) jsonMap['id'] = _id;
    if (_nickname != null) jsonMap['nickname'] = _nickname;
    if (_bornDate != null) jsonMap['bornDate'] = _bornDate;
    if (_auth != null) jsonMap['auth_id'] = _auth;
    if (_trailers != null) jsonMap['trailers'] = _trailers;
    return jsonMap;
  }

  int? getId() {
    return _id;
  }

  String? getNickName() {
    return _nickname;
  }

  String? getBornDate() {
    return _bornDate;
  }

  int? getAuth() {
    return _auth;
  }

  void setId(int id) {
    _id = id;
  }

  void setNickName(String nickname) {
    _nickname = nickname;
  }

  void setBornDate(String bornDate) {
    _bornDate = bornDate;
  }  

  void setAuth(int auth) {
    _auth = auth;
  }

  @override
  String toString() {
    return '\n{id: $_id, nickname: $_nickname, bornDate: $_bornDate, auth: $_auth}\n';
  }
}