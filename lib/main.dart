import 'package:flutter/material.dart';
// import 'package:my_app/basic_page.dart';
import 'package:my_app/pages/home_movie.dart';
// import 'package:my_app/home_chatty.dart';
// import 'package:my_app/home_horizontalpages.dart';
// import 'package:my_app/profile_page.dart'; //pages_chatty
// import 'package:my_app/home_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomeMoviePages(),
    );
  }
}
