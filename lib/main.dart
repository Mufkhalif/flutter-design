import 'package:flutter/material.dart';
import 'package:my_app/home_chatty.dart';
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
      home: HomeChatty(),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_circle, size: 50, color: Colors.black),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text(
                      'Flutter mcFlutter',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Flutter mcFlutter',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Flutter mcFlutter',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Flutter mcFlutter',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.account_circle, size: 30, color: Colors.black),
                Icon(Icons.lock_clock_sharp, size: 30, color: Colors.black),
                Icon(Icons.account_circle, size: 30, color: Colors.black),
                Icon(Icons.account_circle, size: 30, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}

class BoxContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        BlueBox(),
        Spacer(flex: 2),
        BlueBox(),
        SizedBox(width: 100),
        BlueBox(),
      ]),
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

class BoxRed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(),
      ),
    );
  }
}
