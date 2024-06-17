import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map_app/charger_spot.dart';

/// 充電スポット取得のステータス
enum GetChargerSpotsStatus {
  /// 成功
  ok,

  /// 失敗：指定範囲内に充電スポットが多すぎる
  ngTooManySpots,
}

/// 充電スポット取得のレスポンス
@immutable
class GetChargerSpotsResponse {
  const GetChargerSpotsResponse({
    required this.status,
    required this.spots,
  });

  /// ステータス
  final GetChargerSpotsStatus status;

  /// 取得した充電スポット
  final List<ChargerSpot> spots;
}

/// 充電スポット・リポジトリ
class ChargerSpotsRepository {
  ChargerSpotsRepository();

  /// 最南西の座標（緯度[swLat]・経度[swLng]）と
  /// 最北東の座標（緯度[neLat]・経度[neLng]）と
  /// 範囲内にある充電スポットを取得します。
  Future<GetChargerSpotsResponse> getChargerSpots({
    required double swLat,
    required double swLng,
    required double neLat,
    required double neLng,
  }) async {
    final List<ChargerSpot> spots = _spots ??
        (jsonDecode(await rootBundle.loadString('assets/spots.json')) as List)
            .map((e) => ChargerSpot.fromJson(e as Map<String, dynamic>))
            .toList();

    await Future.delayed(Duration(milliseconds: Random().nextInt(400)));

    final spotsInRegion = spots
        .where((spot) =>
            spot.latitude >= swLat &&
            spot.latitude <= neLat &&
            spot.longitude >= swLng &&
            spot.longitude <= neLng)
        .toList();
    return spotsInRegion.length > 100
        ? const GetChargerSpotsResponse(
            status: GetChargerSpotsStatus.ngTooManySpots,
            spots: [],
          )
        : GetChargerSpotsResponse(
            status: GetChargerSpotsStatus.ok,
            spots: spotsInRegion,
          );
  }

  List<ChargerSpot>? _spots;
}
