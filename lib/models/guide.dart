import 'package:flutter/material.dart';

class Guide {
  final int id;
  final String title;
  final String description;
  final Color color;
  final List<Paragraph> paragraphs;

  Guide({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.paragraphs,
  });
}

class Paragraph {
  final String content;

  Paragraph({required this.content});
}

class BoldParagraph extends Paragraph {
  BoldParagraph({required super.content});
}

class MixedParagraph extends Paragraph {
  final List<Paragraph> list;

  MixedParagraph({
    super.content = '',
    required this.list,
  });
}
