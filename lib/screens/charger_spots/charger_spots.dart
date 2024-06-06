import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/charger_spots_controller.dart';
import 'package:flutter_map_app/screens/charger_spots/charger_spots_logic.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/atom/search_charger_spots_item.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/molecules/charger_spots_carousel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChargerSpots extends ConsumerStatefulWidget {
  const ChargerSpots({super.key});

  @override
  ChargerSpotState createState() => ChargerSpotState();
}

class ChargerSpotState extends ConsumerState<ChargerSpots> {
  GoogleMapController? _controller;

  @override
  void initState() {
    Geolocator.checkPermission().then((permission) {
      if (permission == LocationPermission.denied) {
        Geolocator.requestPermission();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    final chargerSpots = ref.watch(chargerSpotsProvider.select((s) => s.chargerSpots));
    final markers = ref.watch(chargerSpotsProvider.select((s) => s.markers));
    final isLoading = ref.watch(chargerSpotsProvider.select((s) => s.isLoading));
    final isShowCarousel = ref.watch(chargerSpotsProvider.select((s) => s.isShowCarousel));

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(target: tokyoStation, zoom: 14.4746),
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            markers: markers,
            onMapCreated: (controller) async {
              _controller = controller;
              Position? currentPosition;
              try {
                currentPosition = await Geolocator.getCurrentPosition();
              } catch (e) {
                log(e.toString());
              }
              final currentLocation =
                  currentPosition == null ? tokyoStation : LatLng(currentPosition.latitude, currentPosition.longitude);

              await _controller
                  ?.moveCamera(CameraUpdate.newLatLng(LatLng(currentLocation.latitude, currentLocation.longitude)));
              final latlngBounds = await _controller!.getVisibleRegion();
              ref.read(chargerSpotsControllerProvider).fetchChargerSpots(latlngBounds);
            },
          ),
          Positioned(
            top: 51 + topPadding,
            left: 0,
            right: 0,
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : SearchChargeSpotsButton(
                    onTap: () async {
                      final latlngBounds = await _controller!.getVisibleRegion();
                      ref.read(chargerSpotsControllerProvider).fetchChargerSpots(latlngBounds);
                    },
                  ),
          ),
          AnimatedPositioned(
            bottom: isShowCarousel ? 16 : -180,
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () async {
                          final currentLocation = await Geolocator.getCurrentPosition();
                          _controller?.animateCamera(
                              CameraUpdate.newLatLng(LatLng(currentLocation.latitude, currentLocation.longitude)));
                        },
                        child: Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(31),
                            color: const Color(0xFF3A3A3A),
                          ),
                          child: const Icon(Icons.my_location, size: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                if (chargerSpots.isNotEmpty)
                  ChargeSpotsCarousel(
                    spots: chargerSpots,
                    onCardTap: (chargerSpot) {
                      _controller!.animateCamera(CameraUpdate.newLatLng(
                          LatLng(chargerSpot.latitude as double, chargerSpot.longitude as double)));
                      ref.read(chargerSpotsControllerProvider).selectChargerSpot(chargerSpot.uuid);
                    },
                  )
                else
                  const SizedBox(height: 196),
              ],
            ),
          )
        ],
      ),
    );
  }
}
