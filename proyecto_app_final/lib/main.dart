import 'package:flutter/material.dart';
import 'package:proyecto_app_final/login/login.dart';
import 'package:proyecto_app_final/providres/movies_provider.dart';
import 'package:proyecto_app_final/screens/screen.dart';
import 'package:proyecto_app_final/screens/home_screen.dart';

void main() {
  runApp(const AppState());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Péliculas App Udeo',
        home: LoginPage(),
        theme: ThemeData.light()
            .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)));
  }
}
