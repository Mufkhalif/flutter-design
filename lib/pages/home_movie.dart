import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Color darkColor = Color(0xFF1B1E25);
Color darkGreyColor = Color(0xFF696D74);

const imgUrl =
    'https://images.unsplash.com/photo-1622488717091-907d6233d45f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

class HomeMoviePages extends StatefulWidget {
  @override
  _HomeMoviePagesState createState() => _HomeMoviePagesState();
}

class _HomeMoviePagesState extends State<HomeMoviePages> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBarHeight = mediaQuery.padding.top;
    return Scaffold(
        backgroundColor: darkColor,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_awesome_motion,
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5,
          backgroundColor: Color(0xFF1B1E25),
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF546EE5),
          unselectedItemColor: Color(0xFF696D74),
          onTap: _onItemTapped,
        ),
        body: MainPage(
          appBarHeight: appBarHeight,
        ));
  }
}

class BasicHero extends StatelessWidget {
  const BasicHero({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return DetailScreen();
        }));
      },
      child: Hero(
        tag: 'imageHero',
        child: Container(
          width: 240,
          margin: EdgeInsets.only(right: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: 308,
                  width: 234,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                        imgUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text(
                'Hello',
                maxLines: 2,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Rating()
            ],
          ),
        ),
      ),
    );
  }
}

class MovieModel {
  String title;
  String imgUrl;
  MovieModel({required this.title, required this.imgUrl});
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.appBarHeight,
  }) : super(key: key);

  final double appBarHeight;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MovieModel> listMovie = [
    MovieModel(title: 'hello', imgUrl: 'google.com')
  ];

  Future<Null> getData() async {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            SizedBox(height: widget.appBarHeight + 20),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  child: Container(
                    width: 59,
                    height: 59,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: NetworkImage(imgUrl),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning, drama',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF696D74),
                          ),
                        ),
                      ),
                      Text(
                        'Alex Samm',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.notifications_active, color: Color(0xFF696D74))
              ],
            ),
            SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Movie',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'See more',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF696D74),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CardHorizontalMovie(
                    tag: 'imageHero',
                    imgUrl:
                        'https://www.themoviedb.org/t/p/w220_and_h330_face/jWTDtbp2TnUGw1OJoDqq2O9IS0M.jpg',
                    title: 'Jurassic World: Camp Cretaceous',
                  )
                  // CardHorizontalMovie(
                  //   tag: 'imageHero',
                  //   imgUrl:
                  //       'https://www.themoviedb.org/t/p/w220_and_h330_face/jWTDtbp2TnUGw1OJoDqq2O9IS0M.jpg',
                  //   title: 'Jurassic World: Camp Cretaceous',
                  // ),
                  // CardHorizontalMovie(
                  //   tag: 'imageHero1',
                  //   imgUrl:
                  //       'https://www.themoviedb.org/t/p/w220_and_h330_face/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
                  //   title: 'Avengers: Endgame',
                  // ),
                  // CardHorizontalMovie(
                  //   tag: 'imageHero2',
                  //   imgUrl:
                  //       'https://www.themoviedb.org/t/p/w220_and_h330_face/hjS9mH8KvRiGHgjk6VUZH7OT0Ng.jpg',
                  //   title: 'Cruella',
                  // ),
                ],
              ),
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tv Series',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'See more',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF696D74),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: [
                CardVerticalMovie(
                  imgUrl:
                      'https://www.themoviedb.org/t/p/w220_and_h330_face/zAYRe2bJxpWTVrwwmBc00VFkAf4.jpg',
                  title: 'Naruto Shipudden',
                ),
                CardVerticalMovie(
                  imgUrl:
                      'https://www.themoviedb.org/t/p/w220_and_h330_face/6P6tXhjT5tK3qOXzxF9OMLlG7iz.jpg',
                  title: 'Anne with an E',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardVerticalMovie extends StatelessWidget {
  final String imgUrl;
  final String title;

  const CardVerticalMovie({Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            child: Container(
              width: 59,
              height: 59,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Drama',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF696D74),
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Rating()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardHorizontalMovie extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String tag;

  const CardHorizontalMovie(
      {Key? key, required this.imgUrl, required this.title, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return DetailScreen();
        }));
      },
      child: Hero(
        tag: tag,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 240,
            margin: EdgeInsets.only(right: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 308,
                    width: 234,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(
                          imgUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  title,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Rating()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Color(0xFFFFA235),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFFA235),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFFA235),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFFA235),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFFA235),
          size: 16,
        ),
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBarHeight = mediaQuery.padding.top;

    return Scaffold(
        backgroundColor: darkColor,
        body: Container(
          child: SingleChildScrollView(
            child: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: appBarHeight + 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Details Movie',
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Icon(Icons.bookmark, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Hero(
                        tag: 'imageHero',
                        child: Container(
                          height: 462,
                          width: 387,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              image: NetworkImage(
                                imgUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Jurassic World: Camp Cretaceous',
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Director: Eric Richter Strand',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF696D74),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF252932),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Drama',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xFF696D74),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF252932),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Action',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xFF696D74),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Storyline',
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF696D74),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
