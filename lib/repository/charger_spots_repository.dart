import 'package:flutter_map_app/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';

final baseChargerSpotsRepository = Provider.autoDispose<BaseChargerSpotsRepository>((_) => throw UnimplementedError());

abstract class BaseChargerSpotsRepository {
  Future<APIResponse?> getChargerSpots({
    required String swLat,
    required String swLng,
    required String neLat,
    required String neLng,
  });
}

final chargerSpotsRepositoryProvider =
    Provider.autoDispose<BaseChargerSpotsRepository>((ref) => ChargerSpotsRepository());

class ChargerSpotsRepository implements BaseChargerSpotsRepository {
  @override
  Future<APIResponse?> getChargerSpots({
    required String swLat,
    required String swLng,
    required String neLat,
    required String neLng,
  }) async {
    // キーは直接コミットしないようお願いします
    // ↑　対応済み
    final APIResponse? result = await ChargerSpotsApi().chargerSpots(
      apiKey,
      swLat: swLat,
      swLng: swLng,
      neLat: neLat,
      neLng: neLng,
    );
    return result;
  }
}
