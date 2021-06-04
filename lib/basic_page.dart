import 'package:flutter/material.dart';

class BasicPage extends StatefulWidget {
  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Latihan'),
          ),
          body: Stack(
            children: [
              Column(children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(color: Colors.red),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(color: Colors.yellow),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(color: Colors.green),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(color: Colors.blue),
                      )
                    ],
                  ),
                )
              ]),
              ListView(children: [
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
                Text('Selamat datang', style: TextStyle(fontSize: 32)),
              ]),
              Align(
                  // alignment: Alignment.bottomCenter,
                  child: Container(
                width: 200,
                height: 200,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              )),
            ],
          )),
    );
  }
}

class BasicPage1 extends StatefulWidget {
  @override
  _BasicPageState1 createState() => _BasicPageState1();
}

class _BasicPageState1 extends State<BasicPage1> {
  List<Widget> widgets = [];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widgets.add(Text('Data baru ke $counter',
                              style: TextStyle(fontSize: 18)));
                          counter++;
                        });
                      },
                      child: Text('Tambah')),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widgets.removeLast();
                        });
                      },
                      child: Text('Kurang')),
                ],
              ),
              ...widgets,
            ],
          ),
        ),
      ),
    );
  }
}

const imgUrl =
    'https://images.unsplash.com/photo-1591311337241-cecfd26f1da1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2thdGVib2FyZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
