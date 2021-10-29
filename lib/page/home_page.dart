import 'package:flutter/material.dart';
import 'bookrecs.dart';
import '../recommend.dart';
import 'options.dart';

class HomePage extends StatelessWidget{
  String input = '';

  // constants
  final labelTitle = 'Enter the title of a book';
  final getBookRecs = 'Get Book Recommendations';
  final getAuthorRecs = 'Get Author Recommendations';
  final edgeInsets = 20.0;
  final settings = 'Settings';

  Recommend r = Recommend();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book recommender GOD'),
        actions: [
          PopupMenuButton<int>(
              onSelected:(item)=>onSelected(context,item),
              itemBuilder:(context) =>[
                PopupMenuItem(
                    child:Text(settings),
                    value:0
                )
              ]
          ),
        ],
      ),
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
                    input = val;
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () async {
                    var body = [input];

                    var res = await r.RecommendBooks(body);


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:(context) => BookRecs(res:res)
                      ),
                    );
                  },
                  child: Text(getBookRecs),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () async {
                    var body = [input];

                    var res = await r.RecommendAuthors(body);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:(context) => BookRecs(res:res[0])
                      ),
                    );
                  },
                  child: Text(getAuthorRecs),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item){
    switch(item){
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder:(context) => OptionScreen()
          ),
        );
    }
  }
}