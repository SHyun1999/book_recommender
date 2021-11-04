import 'package:flutter/material.dart';
import 'individualbook.dart';
import 'package:page_transition/page_transition.dart';

class BookRecs extends StatelessWidget {

  const BookRecs({Key? key, required this.res, required this.ratings,
  required this.pages, required this.langs}) : super(key: key);

  final List<dynamic> res;
  final List<dynamic> ratings;
  final List<dynamic> pages;
  final List<dynamic> langs;
  static const IconData bookIcon = Icons.book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended books are:'),
      ),

      body: ListView.builder(
        itemCount: res.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height:75,
            child:Card(child:ListTile(
                trailing: const Icon(bookIcon),
                title: Text(res[index],
                style: const TextStyle(fontSize: 17),),
                subtitle: Text(ratings[index]),

                onTap: () { Navigator.of(context).push(PageTransition(


                    child: IndividualBook(book:res[index], rating:double.parse(ratings[index]),
                    pages: int.parse(pages[index]),lang:langs[index]),
                    //pages:pages[index]),

                    type:PageTransitionType.bottomToTop,
                    duration:(const Duration(milliseconds:600)),
                    reverseDuration: (const Duration(milliseconds:600)),
                ));
                }
              ),
            ),
          );
        },
      ),
    );
  }
}