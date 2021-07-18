import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  // using named arguments, the required decorator and a default value for the color
  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
