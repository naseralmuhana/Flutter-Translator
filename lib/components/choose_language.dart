import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/pages/languages/language_page.dart';
import 'package:translator_app/provider/translator_provider.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      height: 80.0,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          buildLanguageButton(
            theme: theme,
            languageTitle: Provider.of<TranslatorData>(context).fromLanguageLabel,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LanguagePage(),
                settings: RouteSettings(arguments: 'From'),
              ),
            ),
          ),
          buildSwitchLanuageButton(context, theme: theme),
          buildLanguageButton(
            theme: theme,
            languageTitle: Provider.of<TranslatorData>(context).toLanguageLabel,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LanguagePage(),
                settings: RouteSettings(arguments: 'To'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Material buildSwitchLanuageButton(context, {theme}) {
    var provider = Provider.of<TranslatorData>(context);
    return Material(
      color: theme.primaryColor,
      child: IconButton(
        icon: Icon(
          Icons.compare_arrows,
          color: Colors.white,
        ),
        onPressed: () {
          var toLanLabel = provider.toLanguageLabel;
          var toLanValue = provider.toLanguageValue;
          var fromLanLabel = provider.fromLanguageLabel;
          var fromLanValue = provider.fromLanguageValue;
          Provider.of<TranslatorData>(context, listen: false).updateFromLanguage(
            label: toLanLabel,
            value: toLanValue,
          );

          Provider.of<TranslatorData>(context, listen: false).updateToLanguage(
            label: fromLanLabel,
            value: fromLanValue,
          );
          Provider.of<TranslatorData>(context, listen: false).clearText();
        },
      ),
    );
  }

  Expanded buildLanguageButton({
    theme,
    Function()? onTap,
    required String languageTitle,
  }) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: theme.primaryColor,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  languageTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
