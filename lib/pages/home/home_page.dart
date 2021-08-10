import 'package:flutter/material.dart';
import 'package:translator_app/components/choose_language.dart';
import 'package:translator_app/components/input_text.dart';
import 'package:translator_app/components/translate_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChooseLanguage(),
            InputText(),
            TranslateText(),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: Text('Google Translate'),
    centerTitle: true,
    elevation: 0.0,
  );
}
