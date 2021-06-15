import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;
  String email;
  String avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name'],
      email: object['email'],
      avatar: object['avatar'],
    );
  }

  static Future<User> getSingleUser(String id) async {
    var url = Uri.parse("https://reqres.in/api/users/" + id);
    var apiResult = await http.get(url);

    print('Response status: ${apiResult.statusCode}');
    print('apiResult body: ${apiResult.body}');

    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
