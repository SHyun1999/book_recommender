
import 'dart:convert';
import 'package:flutter/material.dart';
import 'bookrecs.dart';
import 'Recommend.dart';

void main() => runApp(new MaterialApp(home: new Main()));

class Main extends StatelessWidget {

  String author = '';
  String title = '';

  Recommend r = Recommend();

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
                    var body = [title];

                    var res = await r.RecommendBooks(body);

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
