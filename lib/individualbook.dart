import 'package:flutter/material.dart';
import 'dart:convert';
import 'utils.dart';

class IndividualBook extends StatelessWidget {

  const IndividualBook({Key? key, required this.book}) : super(key: key);

  final String book;
 //https://www.amazon.com/s?k=$book&__mk_es_US=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=38I6J6CRWCC4H&sprefix=rhythm+of+wa%2Caps%2C151&ref=nb_sb_noss_2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book),
      ),

      body: Center(
        child: Column(

          children: [
        ElevatedButton(child:Text("test"),
          onPressed:() =>
              Utils.openLink(url: "https://www.amazon.com/s?k=$book&__mk_es_US=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=38I6J6CRWCC4H&sprefix=rhythm+of+wa%2Caps%2C151&ref=nb_sb_noss_2")
        ),
          ],
        )
      )
    );

  }
}