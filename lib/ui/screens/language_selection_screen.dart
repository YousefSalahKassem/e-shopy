import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider_boilerplate/routes/custom_router.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key key}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: width * 0.9,
                height: 400,
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: Image.asset(
                    'assets/images/kortobaa.png',
                    fit: BoxFit.fitHeight,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Container(
                width: width * 0.9,
                child: Row(
                  children: <Widget>[
                    LanguageButton(
                      locale: context.locale.languageCode,
                      value: 'ar',
                    ),
                    LanguageButton(
                      locale: context.locale.languageCode,
                      value: 'en',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
                },
                child: Text(tr('start')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key key,
    this.locale,
    this.value,
  }) : super(key: key);
  final String locale;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        child: FlatButton(
          onPressed: () {
            context.locale = Locale(value);
          },
          child: Text(
            tr(value),
            style: TextStyle(
              color: locale == value
                  ? Theme.of(context).primaryColor
                  : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
