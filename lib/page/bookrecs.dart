import 'package:flutter/material.dart';
import 'individualbook.dart';
import 'package:page_transition/page_transition.dart';

class BookRecs extends StatelessWidget {

  const BookRecs({Key? key, required this.res}) : super(key: key);

  final List<dynamic> res;
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
            height:70,
            child:Card(child:ListTile(
                trailing: const Icon(bookIcon),
                title: Text(res[index],
                style: const TextStyle(fontSize: 20),),
                onTap: () { Navigator.of(context).push(PageTransition(
                    child: IndividualBook(book:res[index]),
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