import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/pages/home/home_page.dart';
import 'package:translator_app/provider/translator_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TranslatorData(),
      child: MaterialApp(
        title: 'Google Translate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff5848D9),
          scaffoldBackgroundColor: Color(0xfff9f9f9),
        ),
        home: HomePage(),
      ),
    );
  }
}
