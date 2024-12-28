import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:flutter_laravel_api/models/login_model.dart';
import 'package:flutter_laravel_api/models/register_model.dart';
import 'package:flutter_laravel_api/utils/constants/api_url.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  Future<RegisterUsers?> registerUser(RegisterUsers user) async {
    try {
      var respond = await http.post(
        Uri.parse(Api.apiRegisterUrl),
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (respond.statusCode == 200) {
        var responsebodyLogUser = jsonDecode(respond.body);
        print("Voici le user: $responsebodyLogUser");
        if (responsebodyLogUser['result'] == true) {
          return RegisterUsers(
            name: user.name,
            email: user.email,
            password: user.password,
            password_confirm: user.password_confirm,
          );

          //Fluttertoast.showToast(msg: "Utilisateur Connecté avec succes");
        } else {
          print("Reponse du serveur : ${responsebodyLogUser['message']}");
        }
      }else{
        print("Erreur HTTP : ${respond.statusCode}");
        print("Détails : ${respond.body}");
      }
    } catch (e) {
      print(e.toString());
      print('Erreur de connexion : $e');
    }

    return null;
  }

  Future<LoginUsers?> tryLoginUser(LoginUsers user) async {
    try {
      var respond = await http.post(
        Uri.parse(Api.apiLoginrUrl),
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (respond.statusCode == 200) {
        var responsebodyLogUser = jsonDecode(respond.body);
        print("Voici le user: $responsebodyLogUser");
        if (responsebodyLogUser['result'] == true) {
          return LoginUsers(
            email: user.email,
            password: user.password,
          );

          //Fluttertoast.showToast(msg: "Utilisateur Connecté avec succes");
        } else {
          print("Erreur côté serveur : ${responsebodyLogUser['message']}");
        }
      }else{
        print("Erreur HTTP : ${respond.statusCode}");
        print("Détails : ${respond.body}");
      }
    } catch (e) {
      print(e.toString());
      print('Erreur de connexion : $e');
    }

    return null;
  }
}
