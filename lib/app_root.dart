import 'package:flutter/material.dart';
import 'package:flutter_map_app/screens/charger_spots/charger_spots.dart';

// ログイン状態等で表示を切り替えたい時
// アプリ全体のデータを読み込む処理を記載する
// 例えばユーザー情報とか
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {

  @override
  void initState() {
    //
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const ChargerSpots();
  }
}
