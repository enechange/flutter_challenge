import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart';

part 'charger_spots_state.freezed.dart';

@freezed
class ChargerSpotsState with _$ChargerSpotsState {
  const factory ChargerSpotsState({
    /// マップのマーカーがローディング中か
    @Default(false) bool isLoading,

    /// マップのマーカー一覧
    @Default({}) Set<Marker> markers,

    /// 充電スポットの一覧
    @Default([]) List<APIChargerSpot> chargerSpots,

    /// 選択中のマーカーのuuid
    String? selectedMarkerUuid,
  }) = _ChargerSpotsState;

  const ChargerSpotsState._();

  bool get isShowCarousel => selectedMarkerUuid != null;
}
