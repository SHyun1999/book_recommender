import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds:2), (){
      Navigator.of(context).push(MaterialPageRoute(
        builder:(_)=> User(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              //logo here
              //Image.asset('assets/logo_books.png', height:120, width:120),
              SizedBox(height:20,),
              CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Colors.blue),
              )

            ]
          )
      )
    );
  }
}
