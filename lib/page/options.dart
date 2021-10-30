import 'package:book_review/widget/change_font_size_widget.dart';
import 'package:book_review/widget/change_theme_button_widget.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {

  final String dm = 'Dark Mode';
  final String fs = 'Font size';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings owo'),
      ),
      body:ListView(
        children: <Widget>[
          Card(
            child:ListTile(
              title: Text(dm),
              trailing: ChangeThemeButtonWidget(),
            ),
          ),
          Card(
            child:ListTile(
              title: Text(fs),
              trailing: ChangeFontSizeWidget(),
            ),
          ),
        ]

      )


    );
  }
}

