// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginUsers {
  final String email;
  final String password;

  LoginUsers({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginUsers.fromMap(Map<String, dynamic> map) {
    return LoginUsers(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUsers.fromJson(String source) => LoginUsers.fromMap(json.decode(source) as Map<String, dynamic>);
}
