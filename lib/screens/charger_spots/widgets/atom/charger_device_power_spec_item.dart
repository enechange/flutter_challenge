import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/base_charger_spot_content_item.dart';
import 'package:openapi/api.dart';

class ChargerDevicePowerSpecItem extends StatelessWidget {
  final List<APIChargerDevice> chargerDevices;

  const ChargerDevicePowerSpecItem({super.key, required this.chargerDevices});

  @override
  Widget build(BuildContext context) {
    final uniquePowers = chargerDevices.map((e) => e.power).toSet().toList();
    uniquePowers.sort((a, b) => double.parse(a).compareTo(double.parse(b)));

    return BaseChargerSpotContentItem(
      prefixIcon: Icons.electric_bolt,
      titleText: const Text('充電出力'),
      bodyText: Text(uniquePowers.map((e) => '${e}kW').join(', ')),
    );
  }
}
