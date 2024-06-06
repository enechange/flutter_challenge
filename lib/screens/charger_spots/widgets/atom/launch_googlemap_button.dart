import 'package:flutter/material.dart';

class LaunchUrlButton extends StatelessWidget {
  final VoidCallback onTap;

  const LaunchUrlButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Row(
        children: [
          Text(
            '地図アプリで経路を見る',
            style: TextStyle(
              color: Color(0xFF56C600),
              decoration: TextDecoration.underline,
              fontSize: 14,
            ),
          ),
          SizedBox(width: 3),
          Icon(
            Icons.filter_none,
            color: Color(0xFF56C600),
            size: 16,
          ),
        ],
      ),
    );
  }
}
