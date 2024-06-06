import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/charger_device_power_spec_item.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/charger_service_time_note_item.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/charger_spot_devices_item.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/charger_spot_image_item.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/charger_spot_name_item.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/charger_spot_service_time_item.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/launch_googlemap_button.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

class ChargerSpotDescriptionCard extends StatelessWidget {
  final APIChargerSpot spot;
  final Function(APIChargerSpot) onCardTap;

  const ChargerSpotDescriptionCard({super.key, required this.spot, required this.onCardTap});

  void _launchGoogleMaps(double latitude, double longitude) async {
    var googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onCardTap(spot),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: 325,
          width: screenWidth * 0.85,
          child: Column(
            children: [
              SizedBox(
                height: 72,
                width: double.infinity,
                child: ChargerSpotImageItem(chargerSpotImage: spot.images),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 14,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChargerSpotNameItem(name: spot.name),
                      const SizedBox(height: 8),
                      ChargerSpotDevicesItem(chargerDevices: spot.chargerDevices),
                      const SizedBox(height: 12),
                      ChargerDevicePowerSpecItem(chargerDevices: spot.chargerDevices),
                      const SizedBox(height: 12),
                      ChargerSpotServiceTime(
                        serviceTime: spot.chargerSpotServiceTimes.firstWhereOrNull((element) => element.today),
                        nowAvailable: spot.nowAvailable == APIChargerSpotNowAvailableEnum.yes,
                      ),
                      const SizedBox(height: 12),
                      ServiceTimeNoteItem(serviceTimeNote: spot.serviceTimeNote),
                      const SizedBox(height: 12),
                      LaunchUrlButton(
                          onTap: () => _launchGoogleMaps(spot.latitude as double, spot.longitude as double)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
