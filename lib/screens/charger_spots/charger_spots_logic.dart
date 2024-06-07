import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map_app/repository/charger_spots_repository.dart';
import 'package:flutter_map_app/screens/charger_spots/charger_spots_state.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/custom_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ChatRoomState の操作とチャットルームページの振る舞いを記述したモデル。
final chargerSpotsProvider = StateNotifierProvider.autoDispose<ChargerSpots, ChargerSpotsState>(ChargerSpots.new);

class ChargerSpots extends StateNotifier<ChargerSpotsState> {
  ChargerSpots(this._ref) : super(const ChargerSpotsState());

  final AutoDisposeStateNotifierProviderRef<ChargerSpots, ChargerSpotsState> _ref;

  Future<void> selectChargerSpot(String uuid) async {
    _bringMarkerToFront(uuid);
    state = state.copyWith(selectedMarkerUuid: uuid);
  }

  void clearSelectedMarkerUuid() {
    state = state.copyWith(selectedMarkerUuid: null);
  }

  void _bringMarkerToFront(String markerId) {
    const selectedZIndex = 40.0;
    final updatedMarkers = {
      for (final marker in state.markers)
        if (marker.markerId.value == markerId) marker.copyWith(zIndexParam: selectedZIndex) else marker
    };
    state = state.copyWith(markers: updatedMarkers);
  }

  /// 充電スポットの取得とマーカーの作成をし、状態を更新する。
  Future<void> fetchChargerSpots(LatLng southWest, LatLng northEast) async {
    if (state.isLoading) {
      return;
    }

    state = state.copyWith(isLoading: true);

    final spots = await _ref.read(baseChargerSpotsRepository).getChargerSpots(
          swLat: southWest.latitude.toString(),
          swLng: southWest.longitude.toString(),
          neLat: northEast.latitude.toString(),
          neLng: northEast.longitude.toString(),
        );

    if (spots != null) {
      state = state.copyWith(chargerSpots: spots.chargerSpots);
      List<Future<Marker>> markerFutures = [];

      for (int i = 0; i < spots.chargerSpots.length; i++) {
        final spot = spots.chargerSpots[i];
        markerFutures.add(
          _createCustomMarker(
            uuid: spot.uuid,
            position: LatLng(spot.latitude as double, spot.longitude as double),
            chargerSpotsCount: spot.chargerDevices.length,
            onTap: () => state = state.copyWith(selectedMarkerUuid: spot.uuid),
          ),
        );
      }

      final markers = await Future.wait(markerFutures);
      state = state.copyWith(markers: markers.toSet());
    }
    state = state.copyWith(isLoading: false);
  }
}

Future<Marker> _createCustomMarker({
  required String uuid,
  required LatLng position,
  required int chargerSpotsCount,
  required VoidCallback onTap,
}) async {
  final customIcon = await getCustomMarker(chargerSpotsCount);
  return Marker(
    markerId: MarkerId(uuid),
    position: position,
    icon: customIcon,
    onTap: onTap,
  );
}
