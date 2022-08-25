import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/themes/dimensions.dart';

class QuestionModel {
  final Icon icon;
  final String title;
  final String subtitle;

  QuestionModel({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

final options = [
  QuestionModel(
    icon: const Icon(Icons.dashboard, size: sizeLarge),
    title: 'Option One',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: const Icon(Icons.do_not_disturb, size: sizeLarge),
    title: 'Option Two',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: const Icon(Icons.account_circle, size: sizeLarge),
    title: 'Option Three',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: const Icon(Icons.invert_colors, size: sizeLarge),
    title: 'Option Four',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: const Icon(Icons.watch_later, size: sizeLarge),
    title: 'Option Five',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: const Icon(Icons.fastfood, size: sizeLarge),
    title: 'Option Six',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: const Icon(Icons.local_airport, size: sizeLarge),
    title: 'Option Seven',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: const Icon(Icons.settings, size: sizeLarge),
    title: 'Option Eight',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
];
