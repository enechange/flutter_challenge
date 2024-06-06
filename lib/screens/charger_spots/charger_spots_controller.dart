import 'dart:async';

import 'package:flutter_map_app/screens/charger_spots/charger_spots_logic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chargerSpotsControllerProvider = Provider.autoDispose<ChargerSpotController>(
  (ref) => ChargerSpotController(ref, ref.read(chargerSpotsProvider.notifier)),
);

const tokyoStation = LatLng(35.681236, 139.767125);

/// 充電スポット画面のコントローラー
class ChargerSpotController {
  ChargerSpotController(this._ref, this._chargerSpots);

  final AutoDisposeProviderRef<ChargerSpotController> _ref;

  final ChargerSpots _chargerSpots;

  /// 充電スポットを取得する
  Future<void> fetchChargerSpots(LatLngBounds latLngBounds) async {
    await _chargerSpots.fetchChargerSpots(latLngBounds.southwest, latLngBounds.northeast);
    _chargerSpots.clearSelectedMarkerUuid();
  }

  Future<void> selectChargerSpot(String uuid) async {
    _chargerSpots.selectChargerSpot(uuid);
  }
}
