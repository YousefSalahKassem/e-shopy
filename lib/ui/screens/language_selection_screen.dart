import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_boilerplate/routes/router.gr.dart';

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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    ExtendedNavigator.root.replace(Routes.homeScreen);
                  },
                  child: Text(translate('user_actions.start')),
                ),
              ],
            ),
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
            changeLocale(context, value);
            updateState();
          },
          child: Text(
            translate('$value'),
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
