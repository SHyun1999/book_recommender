import 'package:book_review/widget/inkwell_widget.dart';
import 'package:flutter/material.dart';
import '../utils.dart';
import 'package:book_review/widget/rating_bar_widget.dart';


class IndividualBook extends StatefulWidget {

  const IndividualBook({Key? key, required this.book, required this.rating,
    required this.pages, required this.lang}) : super(key: key);

  final int pages;
  final String lang;
  final String book;
  final double rating;

  @override
  State<IndividualBook> createState() => _IndividualBookState();
}

class _IndividualBookState extends State<IndividualBook>
    with SingleTickerProviderStateMixin {
  final gr = const AssetImage("assets/Gr-Logo.png");

  final a = const AssetImage("assets/Amazon-Logo.png");

  late Animation animation;
  late AnimationController animationController;

  @override
  void initState(){
    super.initState();

    animationController = AnimationController(duration:const Duration(seconds: 2), vsync: this);

    animation = IntTween(begin:0, end: widget.pages).animate(
        animationController);

    animationController.forward();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book),
      ),

      body: Center(
        child: Column(

          children: [
            InkwellWidget(book:widget.book),

            RatingBarWidget(rating: widget.rating),

            Text(widget.lang),
            AnimatedBuilder(
              animation: animationController,
                builder:(BuildContext context, _){
                  return Text(animation.value.toString());
                }),


            IconButton(
              icon: Image(image: a),
              iconSize: 50,
              onPressed: () =>
                  Utils.openLink(url: "https://www.amazon.com/s?k=${widget.book}&__mk_es_US=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=38I6J6CRWCC4H&sprefix=rhythm+of+wa%2Caps%2C151&ref=nb_sb_noss_2")
              ,
            )
          ],
        )
      )
    );

  }
}