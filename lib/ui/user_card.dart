import 'package:flutter/material.dart';
import 'package:my_app/model/user.dart';

class CardUser extends StatelessWidget {
  final User user;

  CardUser({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x55000000),
            offset: Offset(1, 1),
            blurRadius: 7,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 75,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: NetworkImage(user.avatar)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID ' + user.id),
              Text('NAMA ' + user.name),
              Text('EMAIL' + user.email),
            ],
          )
        ],
      ),
    );
  }
}
