import 'package:book_review/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Transform.scale(

      scale:1.2,

      child:Switch.adaptive(
        activeColor: Colors.blueGrey,
        activeTrackColor: Colors.white60.withOpacity(0.5),
        inactiveThumbColor: Colors.orange,
        inactiveTrackColor: Colors.amber.withOpacity(0.5),

        value:themeProvider.isDarkMode,
        onChanged:(value){
          final provider = Provider.of<ThemeProvider>(context, listen:false);
          provider.toggleTheme(value);

        },
      ),

    );


  }


}