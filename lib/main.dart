import 'package:flutter/material.dart';
import 'package:flutter_app_005/Pages/first_page.dart';
import 'package:flutter_app_005/Pages/second_page.dart';
import 'package:flutter_app_005/Pages/third_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String homeRoute = '/'; //la pagina inicial
  static const String secondRoute = '/second'; //la pagina segunda
  static const String thirdPage = '/third';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paso de datos entre paginas usando nombres de rutas',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      initialRoute: '/',
      routes: {
        homeRoute: (context) => FirstPage(),
        secondRoute: (context) => SecondPage(),
        thirdPage: (context) => ThirdPage(),

        //listado de paginas que tiene la app
      },
      // home: FirstPage(), // Eliminado para evitar conflicto con initialRoute
    );
  }
}
