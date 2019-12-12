import 'package:src/src.dart';

class Register extends Serializable {
  Register({this.name, this.mail, this.password});

  String name;
  String mail;
  String password;

  @override
  String toString() {
    return 'Register{name: $name, mail: $mail, password: $password}';
  }

  @override
  Map<String, dynamic> asMap() => {
        "name": name,
        "mail": mail,
        "password": password,
      };

  @override
  void readFromMap(Map<String, dynamic> object) {
    name = ifListFirst(object['name']);
    mail = ifListFirst(object["mail"]);
    password = ifListFirst(object["password"]);
  }
}
