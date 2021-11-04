import '../utils.dart';
import 'package:flutter/material.dart';

class InkwellWidget extends StatelessWidget{
  final String book;

  const InkwellWidget({Key? key, required this.book}) : super(key: key);

  final gr = const AssetImage("assets/Gr-Logo.png");

  @override
  Widget build(BuildContext context) {


    return InkWell(
        splashColor: Colors.white.withOpacity(0.6),
        child: Ink.image(image:gr,
        height:85,
        width: double.infinity,
        fit:BoxFit.cover,),
        onTap: () =>
            Utils.openLink(url: "https://www.goodreads.com/search?q=$book&qid=")
    );


  }

}