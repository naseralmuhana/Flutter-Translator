import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/pages/languages/language_list.dart';
import 'package:translator_app/provider/translator_provider.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  // final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // Container(
          //   child: TextField(),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: languageList.length,
              itemBuilder: (context, index) {
                String key = languageList.keys.elementAt(index);
                return Column(
                  children: <Widget>[
                    new ListTile(
                      title: Text("${languageList[key]}"),
                      onTap: () {
                        if (args == 'From') {
                          Provider.of<TranslatorData>(context, listen: false).updateFromLanguage(
                            label: languageList[key]!,
                            value: key,
                          );
                        } else if (args == 'To') {
                          Provider.of<TranslatorData>(context, listen: false).updateToLanguage(
                            label: languageList[key]!,
                            value: key,
                          );
                        }
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      height: 2.0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
