import 'package:flutter/material.dart';

class SearchChargeSpotsButton extends StatelessWidget {
  final VoidCallback onTap;

  const SearchChargeSpotsButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        // タブレットとかで開くと間延びするので設定
        constraints: const BoxConstraints(maxWidth: 400),
        height: 62,
        decoration: BoxDecoration(
          color: const Color(0xFFECF9E3),
          borderRadius: BorderRadius.circular(999),
        ),
        child: const Row(
          children: [
            SizedBox(width: 27),
            Text("このエリアの充電スポットを検索"),
            Spacer(),
            Icon(Icons.search),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
