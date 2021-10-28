import 'dart:convert';
import 'package:flutter/material.dart';
import 'bookrecs.dart';
import 'recommend.dart';

void main() => runApp(new MaterialApp(home: new Main()));

class Main extends StatelessWidget {

  String author = '';
  String title = '';

  // constants
  final labelTitle = 'Enter the title of a book';
  final getRecs = 'Get Recommendations';
  final edgeInsets = 20.0;
  
  Recommend r = Recommend();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(edgeInsets),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: labelTitle,
                  ),
                  onChanged: (val) {
                    title = val;
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
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
                  child: Text(getRecs),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}