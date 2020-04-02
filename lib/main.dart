import 'package:flutter/material.dart';
import 'package:multilayerapp/description_screen.dart';
import 'package:multilayerapp/main_page_screen.dart';

void main() => runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPageScreen(),
        '/description': (context) => DescriptionScreen()
      }
    ));
