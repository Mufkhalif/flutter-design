import 'dart:convert';
import 'package:http/http.dart' as http;

var url = Uri.parse("https://reqres.in/api/users");

class PostResult {
  String? id;
  String? name;
  String? job;
  String? created;

  PostResult({
    this.id,
    this.name,
    this.job,
    this.created,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }

  static Future<PostResult> postDataUser(String name, String job) async {
    var apiResult = await http.post(url, body: {
      "name": name,
      "job": job,
    });

    print('Response status: ${apiResult.statusCode}');
    print('apiResult body: ${apiResult.body}');

    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
