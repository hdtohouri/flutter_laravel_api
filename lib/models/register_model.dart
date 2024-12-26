// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterUsers {
  final String name;
  final String email;
  final String password;
  final String password_confirm;

  RegisterUsers({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirm,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirm': password_confirm,
    };
  }

  factory RegisterUsers.fromMap(Map<String, dynamic> map) {
    return RegisterUsers(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      password_confirm: map['password_confirm'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUsers.fromJson(String source) => RegisterUsers.fromMap(json.decode(source) as Map<String, dynamic>);
}
