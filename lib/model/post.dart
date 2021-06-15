import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  int id;
  String title, body;

  Post({required this.id, required this.title, required this.body});

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
      id: object['id'],
      title: object['title'],
      body: object['body'],
    );
  }

  static Future<List<Post>> connectToApi(int start, int limit) async {
    String baseUrl = "https://jsonplaceholder.typicode.com/posts?_start=" +
        start.toString() +
        "&_limit=" +
        limit.toString();

    var url = Uri.parse(baseUrl);
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body) as List;

    print(jsonObject);

    return jsonObject
        .map<Post>(
          (item) => Post(
            id: item['id'],
            title: item['title'],
            body: item['body'],
          ),
        )
        .toList();
  }
}
