
import 'package:dub_tralers/models/user.dart';

class UserT extends User{
  String? _email;

  UserT(int id, String nickname, String bornDate, String email, int auth, List<int> trailers)
      : super(id, nickname, bornDate, auth, trailers) {
    _email = email;
  }

  UserT.fromArray(List<dynamic> myarray) : super(0, '', '', 0, []) {
    if (myarray.length == 5) {
      super.setId(myarray[0]);
      super.setNickName( myarray[1]);
      super.setBornDate(myarray[2]);
      _email = myarray[3] as String?;
      super.setAuth(myarray[4]);
    }
  }

  factory UserT.fromJson(dynamic json) {
    return UserT.fromArray([
        json['id'],
        json['nickname'],
        json['bornDate'],
        json['email'],
        json['auth_id']
      ]
    );
  }

  static List<UserT> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserT.fromJson(json)).toList();
  }

  String? getEmail() {
    return _email;
  }

  void setEmail(String email) {
    _email = email;
  }

  @override
  String toString() {
    return '\n{id: ${super.getId()}, nickname: ${super.getNickName()}, bornDate: ${super.getBornDate()}, email: $_email, auth: ${super.getAuth()}}\n';
  }

}