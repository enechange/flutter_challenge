import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/charger_spots_logic.dart';
import 'package:flutter_map_app/screens/charger_spots/widgets/molecules/charger_spot_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';

class ChargeSpotsCarousel extends ConsumerStatefulWidget {
  final List<APIChargerSpot> spots;
  final Function(APIChargerSpot) onCardTap;

  const ChargeSpotsCarousel({super.key, required this.spots, required this.onCardTap});

  @override
  ConsumerState<ChargeSpotsCarousel> createState() => _ChargeSpotsCarouselState();
}

class _ChargeSpotsCarouselState extends ConsumerState<ChargeSpotsCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.85);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedUuid = ref.watch(chargerSpotsProvider.select((s) => s.selectedMarkerUuid));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.animateToPage(
        widget.spots.indexWhere((element) => element.uuid == selectedUuid),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });

    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 325,
      child: PageView(
        controller: _pageController,
        children: widget.spots.map((e) => ChargerSpotDescriptionCard(spot: e, onCardTap: widget.onCardTap)).toList(),
      ),
    );
  }
}
