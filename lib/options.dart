
import 'package:book_review/widget/change_theme_button_widget.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings owo'),
      ),
      body: Container(
        child: Center(
          child: ChangeThemeButtonWidget(),
        ),
      ),
    );
  }
}

