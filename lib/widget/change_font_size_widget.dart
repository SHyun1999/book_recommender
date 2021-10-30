import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeFontSizeWidget extends StatelessWidget{
  const ChangeFontSizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        onSelected:(item)=>onSelected(item),
        itemBuilder:(context)=>[
          const PopupMenuItem(
            child: Text("Small"),
            value: 1,
          ),const PopupMenuItem(
            child: Text("Medium"),
            value: 2,
          ),const PopupMenuItem(
            child: Text("Large"),
            value: 3,
          )
        ]

    );
  }

  void onSelected(int item){
    switch(item){
      case 1: break;
      case 2: break;
      case 3: break;

    }
  }

}