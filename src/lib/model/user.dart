import 'package:meta/meta.dart';
import 'package:src/src.dart';

class User {
  User({
    @required this.name,
    @required this.mail,
    @required this.password,
  });

  String mail;
  String name;
  String password;

  @override
  String toString() {
    return 'User{name: $name, mail: $mail, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          mail == other.mail &&
          password == other.password;

  @override
  int get hashCode => name.hashCode ^ mail.hashCode ^ password.hashCode;

  @override
  Map<String, dynamic> asMap() => {
        "name": name,
        "mail": mail,
        "password": password,
      };

  @override
  void readFromMap(Map<String, dynamic> object) {
    name = ifListFirst(object["name"]);
    mail = ifListFirst(object["mail"]);
    password = ifListFirst(object["password"]);
  }
}
