import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ChargerSpotNameItem extends StatelessWidget {
  final String name;

  const ChargerSpotNameItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      name,
      maxLines: 1,
      maxFontSize: 18,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
