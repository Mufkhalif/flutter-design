import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int id;
  String email;
  String name;
  String avatar;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['first_name'],
      avatar: json['avatar'],
    );
  }
}

class ReponseApi {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> data;

  ReponseApi({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ReponseApi.fromJson(Map<String, dynamic> json) {
    print(json['data'].runtimeType);

    return ReponseApi(
      page: json['page'],
      data: json['data']
          .map<User>(
            (item) => User(
              id: item['id'],
              email: item['email'],
              name: item['first_name'],
              avatar: item['avatar'],
            ),
          )
          .toList(),
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
    );
  }

  static Future<ReponseApi> getListUser() async {
    var url = Uri.parse("https://reqres.in/api/users?page=4");
    var apiResult = await http.get(url);

    ReponseApi res = ReponseApi.fromJson(
      json.decode(apiResult.body),
    );

    return res;
  }
}
