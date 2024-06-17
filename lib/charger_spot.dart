import 'package:flutter/foundation.dart';

/// 充電スポット情報
@immutable
class ChargerSpot {
  const ChargerSpot({
    required this.uuid,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.chargerDevices,
    required this.serviceTimes,
    this.imageUrl,
  });

  /// 充電スポットのUUID
  final String uuid;

  /// 充電スポットの名称
  final String name;

  /// 充電スポットの緯度
  final double latitude;

  /// 充電スポットの経度
  final double longitude;

  /// 充電器情報
  /// ※ カードの「充電器数」「充電出力」およびマーカーの充電器数の表示のために使用します
  final List<ChargerDevice> chargerDevices;

  /// サービス提供時間
  /// ※ カードの「営業中/営業時間外」で使用します
  final List<ServiceTime> serviceTimes;

  /// 充電スポットの写真URL
  /// ※ カードカードのサムネイル表示に使用します
  final String? imageUrl;

  ChargerSpot.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String,
        name = json['name'] as String,
        latitude = json['latitude'] as double,
        longitude = json['longitude'] as double,
        chargerDevices = (json['charger_devices'] as List)
            .map((e) => ChargerDevice.fromJson(e as Map<String, dynamic>))
            .toList(),
        serviceTimes = (json['service_times'] as List)
            .map((e) => ServiceTime.fromJson(e as Map<String, dynamic>))
            .toList(),
        imageUrl = json['image_url'] as String?;
}

/// 充電器情報
@immutable
class ChargerDevice {
  const ChargerDevice({
    required this.uuid,
    required this.power,
  });

  /// 充電器のUUID
  final String uuid;

  /// 充電器の出力(kW)
  final num power;

  ChargerDevice.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String,
        power = json['power'] as num;
}

/// サービス提供時間
@immutable
class ServiceTime {
  const ServiceTime({
    this.startTime,
    this.endTime,
    required this.businessDay,
    required this.day,
  });

  /// 開始時刻（hh:mm形式）
  final String? startTime;

  /// 終了時刻（hh:mm形式）
  final String? endTime;

  /// 営業日かどうか（true: 営業日、false: 休業日、null: 不明）
  final bool businessDay;

  /// 曜日
  final ServiceTimeDay day;

  ServiceTime.fromJson(Map<String, dynamic> json)
      : startTime = json['start_time'] as String?,
        endTime = json['end_time'] as String?,
        businessDay = json['business_day'] as bool,
        day = ServiceTimeDay.values
            .firstWhere((e) => e.name == (json['day'] as String));
}

/// サービス提供時間の曜日
enum ServiceTimeDay {
  /// 日曜日
  sunday,

  /// 月曜日
  monday,

  /// 火曜日
  tuesday,

  /// 水曜日
  wednesday,

  /// 木曜日
  thursday,

  /// 金曜日
  friday,

  /// 土曜日
  saturday,

  /// 祝日
  holiday,

  /// 平日
  weekday;
}
