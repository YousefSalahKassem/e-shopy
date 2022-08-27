import 'package:flutter/material.dart';

class QuestionModel {
  final IconData icon;
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
    icon: Icons.dashboard,
    title: 'Option One',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: Icons.do_not_disturb,
    title: 'Option Two',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: Icons.account_circle,
    title: 'Option Three',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: Icons.invert_colors,
    title: 'Option Four',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: Icons.watch_later,
    title: 'Option Five',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: Icons.fastfood,
    title: 'Option Six',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: Icons.local_airport,
    title: 'Option Seven',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  QuestionModel(
    icon: Icons.settings,
    title: 'Option Eight',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
];
