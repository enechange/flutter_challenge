import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/base_charger_spot_content_item.dart';
import 'package:openapi/api.dart';

class ChargerSpotDevicesItem extends StatelessWidget {
  final List<APIChargerDevice> chargerDevices;

  const ChargerSpotDevicesItem({super.key, required this.chargerDevices});

  @override
  Widget build(BuildContext context) {
    return BaseChargerSpotContentItem(
      prefixIcon: Icons.power,
      titleText: const Text('充電器数'),
      bodyText: Text('${chargerDevices.length}台'),
    );
  }
}
