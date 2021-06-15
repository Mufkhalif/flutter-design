import 'dart:convert';

class User {
  String name;
  int age;

  User(this.name, this.age);

  factory User.fromJson(dynamic json) {
    return User(json['name'] as String, json['age'] as int);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }
}

class Tutorial {
  String title;
  String description;
  User author;

  Tutorial(this.title, this.description, this.author);

  factory Tutorial.fromJson(dynamic json) {
    return Tutorial(
      json['title'],
      json['description'],
      User.fromJson(json['author']),
    );
  }

  @override
  String toString() {
    return '{ ${this.title}, ${this.description}, ${this.author} }';
  }
}

class Product {
  String name;
  int quantity;

  Product({
    required this.name,
    required this.quantity,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
    );
  }

  @override
  String toString() {
    return '{ name: ${this.name}, quantity: ${this.quantity} }';
  }
}

// void main() {
//   String arrayObjsText =
//       '{"tags": [{"name": "dart", "quantity": 12}, {"name": "flutter", "quantity": 25}, {"name": "json", "quantity": 8}]}';

//   var responseApi = jsonDecode(arrayObjsText)["tags"] as List;
//   List<Product> listProduct = responseApi.map((item) => Product.fromJson(item)).toList();

//   listProduct.forEach((item) {
//     print('{ name: ${item.name}, quantity: ${item.quantity} }');
//   });

//   print(listProduct[2]);

//  ===========

//      String arrayText = '{"tags": ["dart", "flutter", "json"]}';

//    var tagJson = jsonDecode(arrayText)["tags"];
//    List<String> tags = List.from(tagJson);

//   print(tags[1]);

//  ===========

//    String nestedObjText =
//       '{"title": "Dart Tutorial", "description": "Way to parse Json", "author": {"name": "bezkoder", "age": 30}}';

//   Tutorial tutorial = Tutorial.fromJson(jsonDecode(nestedObjText));

//   print(tutorial.author.name);

//  ===========

//   String objText = '{"name":"Mufkhalif", "age":19 }';

//   User user = User.fromJson(jsonDecode(objText));

//   print(user.name);

//  ===========
// }
