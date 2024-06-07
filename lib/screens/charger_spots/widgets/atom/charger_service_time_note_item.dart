import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/base_charger_spot_content_item.dart';

class ServiceTimeNoteItem extends StatelessWidget {
  final String? serviceTimeNote;

  const ServiceTimeNoteItem({super.key, required this.serviceTimeNote});

  @override
  Widget build(BuildContext context) {
    return BaseChargerSpotContentItem(
      prefixIcon: Icons.today,
      titleText: const Text('定休日'),
      bodyText: AutoSizeText(
        serviceTimeNote ?? '-',
        maxLines: 2,
        minFontSize: 10,
        maxFontSize: 14,
      ),
    );
  }
}
