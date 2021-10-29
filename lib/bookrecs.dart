import 'package:flutter/material.dart';
import 'dart:convert';
import 'individualbook.dart';


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
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(
                  builder:(context) => IndividualBook(book:res[index])
              ),
            );}
          );
        },
      ),
    );
  }
}