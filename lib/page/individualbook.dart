import 'package:flutter/material.dart';
import '../utils.dart';

class IndividualBook extends StatelessWidget {

  const IndividualBook({Key? key, required this.book}) : super(key: key);

  final String book;
  final gr = const AssetImage("assets/Gr-Logo.png");
  final a = const AssetImage("assets/Amazon-Logo.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book),
      ),

      body: Center(
        child: Column(

          children: [
            ElevatedButton(
            child: Image(image: gr),

            onPressed: () =>
                Utils.openLink(url: "https://www.goodreads.com/search?q=$book&qid=")
          ),
            Text("LOREM IPSUM"),

            IconButton(
              icon: Image(image: a),
              iconSize: 50,
              onPressed: () =>
                  Utils.openLink(url: "https://www.amazon.com/s?k=$book&__mk_es_US=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=38I6J6CRWCC4H&sprefix=rhythm+of+wa%2Caps%2C151&ref=nb_sb_noss_2")
              ,
            )
          ],
        )
      )
    );

  }
}