import 'package:auto_size_text/auto_size_text.dart';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:flutter_map_app/app_root.dart';
import 'package:flutter_map_app/repository/charger_spots_repository.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/custom_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
          overrides: [
            baseChargerSpotsRepository.overrideWith((ref) => ref.read(chargerSpotsRepositoryProvider)),
          ],
      child: MaterialApp(
        title: 'Flutter Map App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppRoot(),
      ),
    );
  }
}