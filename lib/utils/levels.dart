import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

final List<Level> levels = [
  Level(
    id: 0,
    name: "Classic\njokes",
    description: "Questions on knowledge\nof classic jokes\nand quotes",
    image: "assets/png/person1.png",
    color: AppTheme.red,
    imageWidth: 148.w,
    imageHeight: 191.h,
    bottom: 0,
    right: 0,
    quotes: classicQuotes,
  ),
  Level(
    id: 0,
    name: "Modern\njokes",
    description: "Questions on knowledge\nof modern jokes\nand quotes",
    image: "assets/png/person2.png",
    color: AppTheme.greenAccent,
    imageWidth: 138.w,
    imageHeight: 165.h,
    bottom: 0,
    right: 11.w,
    quotes: modernQuotes,
  ),
  Level(
    id: 0,
    name: "Most known\njokes",
    description: "Questions on knowledge\nof most known jokes\nand quotes",
    image: "assets/png/person3.png",
    color: AppTheme.orange,
    imageWidth: 167.w,
    imageHeight: 134.h,
    bottom: 0,
    right: 0,
    quotes: mostKnownQuotes,
  ),
];
