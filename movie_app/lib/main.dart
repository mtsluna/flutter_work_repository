import 'package:flutter/material.dart';
import 'package:movie_app/src/pages/home_page.dart';
import 'package:movie_app/src/pages/movie_detail.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext c) => HomePage(),
        'detalle': (BuildContext c) => MovieDetail()
      },
    );
  }
}