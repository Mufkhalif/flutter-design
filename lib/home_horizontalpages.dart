import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHorizontalPages extends StatefulWidget {
  @override
  _HomeHorizontalPagesState createState() => _HomeHorizontalPagesState();
}

class _HomeHorizontalPagesState extends State<HomeHorizontalPages> {
  int _selectedIndex = 0;

  void initState() {
    super.initState();
    print("initState ... ... ...");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';
    final mediaQuery = MediaQuery.of(context);
    final appBarHeight = mediaQuery.padding.top;
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'School',
            ),
          ],
          elevation: 5,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF5C9DFF),
          // unselectedItemColor: Color(0xFFF2F2F2),
          onTap: _onItemTapped,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: appBarHeight),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Hello, Jeremy!',
                  style: GoogleFonts.nunito(
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Recommended for you',
                  style: GoogleFonts.nunito(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 215,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    HorizontalCard(
                      companyName: 'Google',
                      position: 'Web Developer',
                      imgUrl:
                          'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png',
                      desc: 'Rp6.500k/mo . Jakarta, Indonesia',
                      type: 'Full Time',
                    ),
                    HorizontalCard(
                      companyName: 'Bukalapak',
                      position: 'WebD eveloper',
                      imgUrl:
                          'https://1.bp.blogspot.com/-wLr0kO3vi0o/XvdEPGvH0zI/AAAAAAAABVA/9fFxTqMSmOQNQpDd29mZ4mMRPA315rzSQCLcBGAsYHQ/s1600/Artboard%2B1.png',
                      desc: 'Rp8.500k/mo . Jakarta Selatan, Indonesia',
                      type: 'Part Time',
                    ),
                    HorizontalCard(
                      companyName: 'Twitter',
                      position: 'Mobile Developer',
                      imgUrl:
                          'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png',
                      desc: 'Rp18.500k/mo . Jakarta Selatan, Indonesia',
                      type: 'Part Time',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Nearby Job',
                  style: GoogleFonts.nunito(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 20),
              RowTile(
                companyName: 'Twitter',
                position: 'Mobile Developer',
                imgUrl:
                    'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png',
                desc: 'Rp18.500k/mo',
                type: 'Part Time',
              ),
              RowTile(
                companyName: 'Kopi Janji jiwa',
                position: 'Bartender',
                imgUrl:
                    'https://cloudfront.gotomalls.com/uploads/retailers/logo/MPuaW7t5IFd1C9Xy-MPuaMNt5IFG1iaXN-janji-jiwa-1571726942_1.jpg',
                desc: 'Rp8.500k/mo',
                type: 'Part Time',
              ),
              RowTile(
                companyName: 'Chatime',
                position: 'Casier',
                imgUrl:
                    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1082b591543169.5e3446a86f4c0.png',
                desc: 'Rp5.500k/mo',
                type: 'Part Time',
              ),
              RowTile(
                companyName: 'Twitter',
                position: 'Software Developer',
                imgUrl:
                    'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png',
                desc: 'Rp18.500k/mo',
                type: 'Part Time',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowTile extends StatelessWidget {
  final String companyName;
  final String position;
  final String desc;
  final String type;
  final String imgUrl;

  const RowTile(
      {Key? key,
      required this.companyName,
      required this.position,
      required this.desc,
      required this.type,
      required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      alignment: Alignment(-.2, 0),
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 16)),
                ),
                Text(
                  companyName,
                  style: GoogleFonts.nunito(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        desc,
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFFCDA64),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Text(
                          type,
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ])
              ],
            ),
          )
        ]));
  }
}

class HorizontalCard extends StatelessWidget {
  final String companyName;
  final String position;
  final String desc;
  final String type;
  final String imgUrl;

  const HorizontalCard(
      {Key? key,
      required this.companyName,
      required this.position,
      required this.desc,
      required this.type,
      required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 277,
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment(-.2, 0),
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            companyName,
            style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 16)),
          ),
          Text(
            position,
            style: GoogleFonts.nunito(
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            desc,
            style: GoogleFonts.nunito(
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            maxLines: 1,
          ),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Color(0xFF717171),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Text(
                type,
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(color: Colors.white)),
              ),
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color: Color(0xFF717171)),
              onPressed: () {},
            )
          ])
        ]),
      ),
    );
  }
}

const imgUrl =
    'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png';
