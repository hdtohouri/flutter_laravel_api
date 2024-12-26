import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_api/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_laravel_api/repositories/authentication_repository.dart';
import 'package:flutter_laravel_api/screens/login_screen.dart';
import 'package:flutter_laravel_api/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(AuthenticationRepository()),
        child: Login_screen(),
      ),
    );
  }
}
