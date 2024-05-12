import 'package:flutter_map_app/utils/logger.dart';
import 'package:openapi/api.dart';

class ChargerSpotsRepository {
  ChargerSpotsRepository();

  Future<APIResponse?> getChargerSpots({
    required String swLat,
    required String swLng,
    required String neLat,
    required String neLng,
  }) async {
    // キーは直接コミットしないようお願いします
    const apiKey = String.fromEnvironment('X_EVENE_NATIVE_API_TOKEN');
    logger.d('apiKey: : $apiKey');
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