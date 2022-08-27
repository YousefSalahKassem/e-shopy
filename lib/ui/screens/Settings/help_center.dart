import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/question_model.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.help.tr(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: options.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => _cardItem(context, options[index]),
      ),
    );
  }
}

Widget _cardItem(BuildContext context, QuestionModel item) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(10.0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(5.0, 5.0),
          blurRadius: 10.0,
          spreadRadius: 5.0,
        ),
      ],
    ),
    child: ListTile(
      leading: Icon(item.icon, size: sizeLarge, color: Theme.of(context).iconTheme.color,),
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        item.subtitle,
        style: Theme.of(context).textTheme.headline6,
      ),
    ),
  );
}
