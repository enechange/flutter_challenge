import 'package:flutter/material.dart';
import 'package:flutter_map_app/app_root.dart';
import 'package:flutter_map_app/repository/charger_spots_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
