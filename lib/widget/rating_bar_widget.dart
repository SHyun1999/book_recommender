import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utils.dart';
import 'package:flutter/material.dart';

class RatingBarWidget extends StatelessWidget{
  final double rating;

  const RatingBarWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );


  }

}