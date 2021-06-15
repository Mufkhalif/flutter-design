import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/post_bloc.dart';
import 'package:my_app/ui/main_page.dart';
import 'package:my_app/ui/sample_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SampelPage(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: BlocProvider(
//           create: (context) => PostBloc(
//             PostLoaded(
//               posts: [],
//               hasReachedMax: false,
//             ),
//           )..add(
//               PostEvent(),
//             ),
//           child: MainPage(),
//         ),
//       ),
//     );
//   }
// }
