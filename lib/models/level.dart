import 'package:flutter/material.dart';
import 'package:laughmaker_your_journal/models/models.dart';

class Level {
  final int id;
  final String name;
  final String description;
  final String image;
  final Color color;
  final double imageWidth;
  final double imageHeight;
  final double? right;
  final double? bottom;
  final List<Quote> quotes;

  Level({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.color,
    required this.imageWidth,
    required this.imageHeight,
    this.right,
    this.bottom,
    required this.quotes,
  });
}
