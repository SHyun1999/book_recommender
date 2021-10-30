import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeFontSizeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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

}