import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_page.dart';

class Login extends StatefulWidget {
  @override
  _MyAppStateS createState() => _MyAppStateS();
}

class _MyAppStateS extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MyApp1();
  }
}

class MyApp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState1();
  }
}

class _MyAppState1 extends State<MyApp1> {

  bool _isLoggedIn = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'RobotoMono',
      ),
      home: Scaffold(
        body: Center(
          child: _isLoggedIn
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all( Radius.circular(150.0)),
                  color: Colors.green,
                ),
                height: 150,
                width: 150,
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/user.png")

                ),
              ),
              const Text("Welcome! ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40.0,
                  )),


              Text(_googleSignIn.currentUser!.displayName.toString()),
              ElevatedButton(


                child: Text("Logout",
                    style: TextStyle(
                        fontSize: 35.0, color: Colors.grey[350])),
                onPressed: () {
                  _logout();
                },
              ),
              Center(
                child: ElevatedButton(

                  child: Text('Main menu',
                      style: TextStyle(
                          fontSize: 35.0, color: Colors.grey[300])),
                  onPressed: () {
                    print(_googleSignIn.currentUser!.photoUrl.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:(context) => HomePage()

                      ),
                    );
                  },
                ),
              ),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
                child: ElevatedButton(onPressed: ()=> _login(),
                  child: const Text("SIGN IN"),
                ),
                  //darkMode: true,
                  // default: false}
                ),
            ],
          ),
        ),
      ),
    );
  }
}