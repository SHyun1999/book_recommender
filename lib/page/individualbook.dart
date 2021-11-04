import 'package:book_review/widget/inkwell_widget.dart';
import 'package:flutter/material.dart';
import '../utils.dart';
import 'package:book_review/widget/rating_bar_widget.dart';


class IndividualBook extends StatefulWidget {

  const IndividualBook({Key? key, required this.book, required this.rating,
    required this.revs, required this.lang}) : super(key: key);

  final int revs;
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

    animationController = AnimationController(duration:const Duration(seconds: 3), vsync: this);

    animation = IntTween(begin:0, end: widget.revs).animate(
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

          children: <Widget>[
            InkwellWidget(book:widget.book),
            SizedBox(height: 25),

            RatingBarWidget(rating: widget.rating),
            SizedBox(height: 25),

            Text(widget.lang),
            SizedBox(height: 25),
            AnimatedBuilder(
              animation: animationController,
                builder:(BuildContext context, _){
                  return RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize:20),
                    children: [
                      TextSpan(text: animation.value.toString()),
                      const WidgetSpan(
                        child: Icon(Icons.groups, size:20),

                      ),
                      const TextSpan(text: ' have read this. Be the next!'),
                    ]
                  ));


                }),
            SizedBox(height: 25),


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