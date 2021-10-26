import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(home: new Main()));

class Main extends StatelessWidget {

  String author = '';
  String title = '';

  Future<List> RecommendBooks(var body) async {

    var client = new http.Client();
    var uri = Uri.parse("https://api-book-rec-last.herokuapp.com/RecommendBooks");


    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);


    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);

      if (resp.statusCode == 200) {

        var result = await json.decode(resp.body);
        return result;

      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return [];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter title of a book',
                  ),
                  onChanged: (val) {
                    title = val;
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    var body =[title];

                    var res = await RecommendBooks(body);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => BookRecs(res:res)
                      ),
                    );
                  },
                  child: Text("Get Recommendations"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookRecs extends StatelessWidget {

  const BookRecs({Key? key, required this.res}) : super(key: key);

  final List<dynamic> res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended books are:'),
      ),

      body: ListView.builder(
        itemCount: res.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(res[index]),
          );
        },
      ),
    );
  }
}