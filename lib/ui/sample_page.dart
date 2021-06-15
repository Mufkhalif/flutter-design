import 'package:flutter/material.dart';
import 'package:my_app/model/users.dart';

class SampelPage extends StatefulWidget {
  @override
  _SampelPageState createState() => _SampelPageState();
}

class _SampelPageState extends State<SampelPage> {
  List<User> list = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    ReponseApi res = await ReponseApi.getListUser();

    setState(() {
      list = res.data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        child: Icon(Icons.search),
      ),
      appBar: AppBar(
        title: Text('ini title'),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          top: 20,
        ),
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var item = list[index].name;
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
