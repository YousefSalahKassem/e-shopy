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
  String locale;

  @override
  void initState() {
    super.initState();
    locale = 'ar';
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
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.only(top: 104),
                child: Center(
                  child: Image.asset(
                    'assets/images/kortobaa.png',
                    fit: BoxFit.cover,
                    width: 100,
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
                      locale: locale,
                      value: 'ar',
                      updateState: () {
                        setState(() {
                          locale = 'ar';
                        });
                      },
                    ),
                    LanguageButton(
                      locale: locale,
                      value: 'en',
                      updateState: () {
                        setState(() {
                          locale = 'en';
                        });
                      },
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
  const LanguageButton({Key key, this.locale, this.value, this.updateState})
      : super(key: key);
  final String locale;
  final String value;
  final Function updateState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        child: FlatButton(
          onPressed: () {
            context.locale = Locale(value);
            updateState();
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
