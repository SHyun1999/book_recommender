import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import 'package:book_review/provider/theme_provider.dart';

class User extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _User();
  }
}

class _User extends State<User> {

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
  Widget build(BuildContext context)=>ChangeNotifierProvider(
  create: (context) => ThemeProvider(),
  builder: (context, _){
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: Scaffold(
        body: Center(
          child: _isLoggedIn
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder:(_)=> HomePage()
                    ));
                  },
                ),
              ),
            ],
          )
              :Column(
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
  );
}