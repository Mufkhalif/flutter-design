import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final appBarHeight = mediaQuery.padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            imgUrl,
            fit: BoxFit.fitHeight,
            height: height,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: appBarHeight),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: height / 10,
              ),
              Column(children: [
                for (final buttonData in iconButtons) ...[
                  IconButton(
                    icon: Icon(buttonData.icon),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  Text(
                    buttonData.amont.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]
              ]),
              Spacer(),
              ModalDescriptionBox(),
              SizedBox(
                height: 10,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class ModalDescriptionBox extends StatefulWidget {
  @override
  _ModalDescriptionBoxState createState() => _ModalDescriptionBoxState();
}

class _ModalDescriptionBoxState extends State<ModalDescriptionBox> {
  final bool isFollowed = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        width: width * 0.9,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We love Skate same like you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Kamu pasti bingung ya maksud rumus di atas. Tenang aja, di bawah ini udah ada contoh soal dan pembahasannya kok. Jadi, bisa kamu pahami dengan baik',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 4,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Row(
                            children: [
                              Text(
                                isFollowed ? 'Following' : 'Follow',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Icon(
                                  Icons.add,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const imgUrl =
    'https://images.unsplash.com/photo-1591311337241-cecfd26f1da1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2thdGVib2FyZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

class IconButtonData {
  final IconData icon;
  final int amont;

  IconButtonData({required this.icon, required this.amont});
}

final iconButtons = [
  IconButtonData(icon: Icons.comment, amont: 3),
  IconButtonData(icon: Icons.favorite_outline, amont: 300),
  IconButtonData(icon: Icons.remove_red_eye, amont: 100),
];
