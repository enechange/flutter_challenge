import 'package:flutter/material.dart';

class BaseChargerSpotContentItem extends StatelessWidget {
  final IconData prefixIcon;
  final Widget titleText;
  final Widget bodyText;

  const BaseChargerSpotContentItem({
    super.key,
    required this.prefixIcon,
    required this.titleText,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(prefixIcon, color: const Color(0xFFFFB800), size: 16),
            const SizedBox(width: 2),
            SizedBox(width: 88, child: titleText),
          ],
        ),
        Expanded(child: bodyText),
      ],
    );
  }
}
