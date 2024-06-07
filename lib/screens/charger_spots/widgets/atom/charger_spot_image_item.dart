import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class ChargerSpotImageItem extends StatelessWidget {
  final List<APIChargerSpotImage> chargerSpotImage;

  const ChargerSpotImageItem({super.key, required this.chargerSpotImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Builder(
        builder: (context) {
          if (chargerSpotImage.isNotEmpty) {
            return Row(
              children: chargerSpotImage
                  .map(
                    (spot) => Expanded(
                      child: Image.network(
                        spot.url,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                  .toList()
                  .expand((widget) => [widget, const SizedBox(width: 4)])
                  .toList()
                ..removeLast(),
            );
          }

          return Image.asset(
            'assets/images/spot_placeholder.png',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          );
        },
      ),
    );
  }
}
