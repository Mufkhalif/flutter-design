import 'package:flutter/material.dart';
import 'package:my_app/theme.dart';

class HomeChatty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: greenColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    'assets/images/profile_pic.png',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sabrina Carpenter',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Travel Freelancer',
                    style: TextStyle(color: lightBlueColor, fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Friends',
                            style: titleTextStyle,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ListFriends(
                              imgUrl: 'assets/images/friend1.png',
                              name: 'Josua',
                              text: 'Hello',
                              time: 'now'),
                          ListFriends(
                              imgUrl: 'assets/images/friend2.png',
                              name: 'Gabriella',
                              text: 'I saw it clearly and mig...',
                              time: '20.00'),
                          Text(
                            'Group',
                            style: titleTextStyle,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GroupTile(
                              isRead: false,
                              imgUrl: 'assets/images/group1.png',
                              name: 'Jakarta Fair',
                              text: 'Why does everyone ca...',
                              time: '11.00'),
                          GroupTile(
                              isRead: true,
                              imgUrl: 'assets/images/group2.png',
                              name: 'Angga',
                              text: 'Why does everyone ca...',
                              time: '11.00'),
                          GroupTile(
                              isRead: false,
                              imgUrl: 'assets/images/group3.png',
                              name: 'Angga',
                              text: 'Why does everyone ca...',
                              time: '11.00'),
                          SizedBox(
                            height: 200,
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class GroupTile extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String text;
  final String time;
  final bool isRead;

  GroupTile(
      {required this.imgUrl,
      required this.name,
      required this.text,
      required this.time,
      required this.isRead});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(
            imgUrl,
            height: 50,
            width: 50,
          ),
          SizedBox(
            width: 12,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              name,
              style: titleTextStyle,
            ),
            Text(
              text,
              style: subTitleTextStyle.copyWith(
                  color: isRead ? blackColor : greyColor,
                  fontWeight: isRead ? FontWeight.w500 : FontWeight.w300),
            ),
          ]),
          Spacer(),
          Text(
            time,
            style: subTitleTextStyle,
          ),
        ],
      ),
    );
  }
}

class ListFriends extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String text;
  final String time;

  ListFriends(
      {required this.imgUrl,
      required this.name,
      required this.text,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Image.asset(
              imgUrl,
              height: 50,
              width: 50,
            ),
            SizedBox(
              width: 12,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: titleTextStyle,
              ),
              Text(
                text,
                style: subTitleTextStyle,
              ),
            ]),
            Spacer(),
            Text(
              time,
              style: subTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  Widget header() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        padding: EdgeInsets.only(
          top: 60,
          left: 18,
          right: 18,
          bottom: 20,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/group1.png',
              height: 50,
              width: 50,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jakarta Fair',
                    style: titleTextStyle,
                  ),
                  Text(
                    '14,209 members',
                    style: subTitleTextStyle,
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/call_btn.png',
              height: 60,
              width: 60,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8FAFC),
        body: Column(
          children: [
            // SizedBox(height: 60),
            header(),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BubbleTile(
                        imgUrl: 'assets/images/friend1.png',
                        name: 'Jakarta Fair',
                        text: 'Why does everyone ca...',
                        time: '11.00'),
                    BubbleTile(
                        imgUrl: 'assets/images/friend2.png',
                        name: 'Jakarta Fair',
                        text: 'Why does everyone ca...',
                        time: '11.00'),
                    BubbleTileRight(),
                  ],
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Type your text'),
                    Image.asset(
                      'assets/images/btn_send.png',
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class BubbleTileRight extends StatelessWidget {
  const BubbleTileRight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xffEBEFF3),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'How are ya guys?',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Color(0xff505C6B)),
                ),
                SizedBox(height: 5),
                Text(
                  '12.00',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Color(0xff505C6B)),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Image.asset(
            'assets/images/friend1.png',
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }
}

class BubbleTile extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String text;
  final String time;

  BubbleTile(
      {required this.imgUrl,
      required this.name,
      required this.text,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            imgUrl,
            height: 40,
            width: 40,
          ),
          SizedBox(width: 12),
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xffEBEFF3),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Color(0xff505C6B)),
                ),
                SizedBox(height: 5),
                Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Color(0xff505C6B)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
