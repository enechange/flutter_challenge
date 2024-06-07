// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charger_spots_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChargerSpotsState {
  /// マップのマーカーがローディング中か
  bool get isLoading => throw _privateConstructorUsedError;

  /// マップのマーカー一覧
  Set<Marker> get markers => throw _privateConstructorUsedError;

  /// 充電スポットの一覧
  List<APIChargerSpot> get chargerSpots => throw _privateConstructorUsedError;

  /// 選択中のマーカーのuuid
  String? get selectedMarkerUuid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChargerSpotsStateCopyWith<ChargerSpotsState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargerSpotsStateCopyWith<$Res> {
  factory $ChargerSpotsStateCopyWith(ChargerSpotsState value, $Res Function(ChargerSpotsState) then) =
      _$ChargerSpotsStateCopyWithImpl<$Res, ChargerSpotsState>;
  @useResult
  $Res call({bool isLoading, Set<Marker> markers, List<APIChargerSpot> chargerSpots, String? selectedMarkerUuid});
}

/// @nodoc
class _$ChargerSpotsStateCopyWithImpl<$Res, $Val extends ChargerSpotsState>
    implements $ChargerSpotsStateCopyWith<$Res> {
  _$ChargerSpotsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? markers = null,
    Object? chargerSpots = null,
    Object? selectedMarkerUuid = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      chargerSpots: null == chargerSpots
          ? _value.chargerSpots
          : chargerSpots // ignore: cast_nullable_to_non_nullable
              as List<APIChargerSpot>,
      selectedMarkerUuid: freezed == selectedMarkerUuid
          ? _value.selectedMarkerUuid
          : selectedMarkerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargerSpotsStateImplCopyWith<$Res> implements $ChargerSpotsStateCopyWith<$Res> {
  factory _$$ChargerSpotsStateImplCopyWith(_$ChargerSpotsStateImpl value, $Res Function(_$ChargerSpotsStateImpl) then) =
      __$$ChargerSpotsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, Set<Marker> markers, List<APIChargerSpot> chargerSpots, String? selectedMarkerUuid});
}

/// @nodoc
class __$$ChargerSpotsStateImplCopyWithImpl<$Res> extends _$ChargerSpotsStateCopyWithImpl<$Res, _$ChargerSpotsStateImpl>
    implements _$$ChargerSpotsStateImplCopyWith<$Res> {
  __$$ChargerSpotsStateImplCopyWithImpl(_$ChargerSpotsStateImpl _value, $Res Function(_$ChargerSpotsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? markers = null,
    Object? chargerSpots = null,
    Object? selectedMarkerUuid = freezed,
  }) {
    return _then(_$ChargerSpotsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      chargerSpots: null == chargerSpots
          ? _value._chargerSpots
          : chargerSpots // ignore: cast_nullable_to_non_nullable
              as List<APIChargerSpot>,
      selectedMarkerUuid: freezed == selectedMarkerUuid
          ? _value.selectedMarkerUuid
          : selectedMarkerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChargerSpotsStateImpl extends _ChargerSpotsState {
  const _$ChargerSpotsStateImpl(
      {this.isLoading = false,
      final Set<Marker> markers = const {},
      final List<APIChargerSpot> chargerSpots = const [],
      this.selectedMarkerUuid})
      : _markers = markers,
        _chargerSpots = chargerSpots,
        super._();

  /// マップのマーカーがローディング中か
  @override
  @JsonKey()
  final bool isLoading;

  /// マップのマーカー一覧
  final Set<Marker> _markers;

  /// マップのマーカー一覧
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  /// 充電スポットの一覧
  final List<APIChargerSpot> _chargerSpots;

  /// 充電スポットの一覧
  @override
  @JsonKey()
  List<APIChargerSpot> get chargerSpots {
    if (_chargerSpots is EqualUnmodifiableListView) return _chargerSpots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chargerSpots);
  }

  /// 選択中のマーカーのuuid
  @override
  final String? selectedMarkerUuid;

  @override
  String toString() {
    return 'ChargerSpotsState(isLoading: $isLoading, markers: $markers, chargerSpots: $chargerSpots, selectedMarkerUuid: $selectedMarkerUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargerSpotsStateImpl &&
            (identical(other.isLoading, isLoading) || other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality().equals(other._chargerSpots, _chargerSpots) &&
            (identical(other.selectedMarkerUuid, selectedMarkerUuid) ||
                other.selectedMarkerUuid == selectedMarkerUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_chargerSpots), selectedMarkerUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargerSpotsStateImplCopyWith<_$ChargerSpotsStateImpl> get copyWith =>
      __$$ChargerSpotsStateImplCopyWithImpl<_$ChargerSpotsStateImpl>(this, _$identity);
}

abstract class _ChargerSpotsState extends ChargerSpotsState {
  const factory _ChargerSpotsState(
      {final bool isLoading,
      final Set<Marker> markers,
      final List<APIChargerSpot> chargerSpots,
      final String? selectedMarkerUuid}) = _$ChargerSpotsStateImpl;
  const _ChargerSpotsState._() : super._();

  @override

  /// マップのマーカーがローディング中か
  bool get isLoading;
  @override

  /// マップのマーカー一覧
  Set<Marker> get markers;
  @override

  /// 充電スポットの一覧
  List<APIChargerSpot> get chargerSpots;
  @override

  /// 選択中のマーカーのuuid
  String? get selectedMarkerUuid;
  @override
  @JsonKey(ignore: true)
  _$$ChargerSpotsStateImplCopyWith<_$ChargerSpotsStateImpl> get copyWith => throw _privateConstructorUsedError;
}
