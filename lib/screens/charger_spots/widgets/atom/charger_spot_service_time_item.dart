import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/base_charger_spot_content_item.dart';
import 'package:openapi/api.dart';

class ChargerSpotServiceTime extends StatelessWidget {
  final APIChargerSpotServiceTime? serviceTime;
  final bool nowAvailable;

  const ChargerSpotServiceTime({super.key, required this.serviceTime, required this.nowAvailable});

  @override
  Widget build(BuildContext context) {
    final titleText = nowAvailable
        ? Text('営業中', style: const TextStyle().copyWith(color: Color(0xFF56C600), fontSize: 14))
        : Text('営業時間外', style: const TextStyle().copyWith(color: Color(0xFF949494), fontSize: 14));

    if (serviceTime == null) {
      return BaseChargerSpotContentItem(
        prefixIcon: Icons.access_time,
        titleText: titleText,
        bodyText: const Text('-'),
      );
    }

    return BaseChargerSpotContentItem(
      prefixIcon: Icons.access_time,
      titleText: titleText,
      bodyText: Text(serviceTime?.startTime == null ? '-' : '${serviceTime!.startTime} - ${serviceTime!.endTime}'),
    );
  }
}
