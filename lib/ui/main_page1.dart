import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/user_bloc.dart';
import 'package:my_app/model/user.dart';
import 'package:my_app/ui/user_card.dart';

class MainPage extends StatelessWidget {
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MVVN'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              bloc.add(
                random.nextInt(10),
              );
            },
            child: Text("get random user"),
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) {
              return CardUser(
                user: user,
              );
            },
          )
        ],
      ),
    );
  }
}
