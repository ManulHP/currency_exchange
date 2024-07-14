// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyEntity _$CurrencyEntityFromJson(Map<String, dynamic> json) {
  return _CurrencyEntity.fromJson(json);
}

/// @nodoc
mixin _$CurrencyEntity {
  String get result => throw _privateConstructorUsedError;
  String get baseCode => throw _privateConstructorUsedError;
  String get targetCode => throw _privateConstructorUsedError;
  double get conversionRate => throw _privateConstructorUsedError;
  double get conversionResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyEntityCopyWith<CurrencyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyEntityCopyWith<$Res> {
  factory $CurrencyEntityCopyWith(
          CurrencyEntity value, $Res Function(CurrencyEntity) then) =
      _$CurrencyEntityCopyWithImpl<$Res, CurrencyEntity>;
  @useResult
  $Res call(
      {String result,
      String baseCode,
      String targetCode,
      double conversionRate,
      double conversionResult});
}

/// @nodoc
class _$CurrencyEntityCopyWithImpl<$Res, $Val extends CurrencyEntity>
    implements $CurrencyEntityCopyWith<$Res> {
  _$CurrencyEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? baseCode = null,
    Object? targetCode = null,
    Object? conversionRate = null,
    Object? conversionResult = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      baseCode: null == baseCode
          ? _value.baseCode
          : baseCode // ignore: cast_nullable_to_non_nullable
              as String,
      targetCode: null == targetCode
          ? _value.targetCode
          : targetCode // ignore: cast_nullable_to_non_nullable
              as String,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      conversionResult: null == conversionResult
          ? _value.conversionResult
          : conversionResult // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyEntityImplCopyWith<$Res>
    implements $CurrencyEntityCopyWith<$Res> {
  factory _$$CurrencyEntityImplCopyWith(_$CurrencyEntityImpl value,
          $Res Function(_$CurrencyEntityImpl) then) =
      __$$CurrencyEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String result,
      String baseCode,
      String targetCode,
      double conversionRate,
      double conversionResult});
}

/// @nodoc
class __$$CurrencyEntityImplCopyWithImpl<$Res>
    extends _$CurrencyEntityCopyWithImpl<$Res, _$CurrencyEntityImpl>
    implements _$$CurrencyEntityImplCopyWith<$Res> {
  __$$CurrencyEntityImplCopyWithImpl(
      _$CurrencyEntityImpl _value, $Res Function(_$CurrencyEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? baseCode = null,
    Object? targetCode = null,
    Object? conversionRate = null,
    Object? conversionResult = null,
  }) {
    return _then(_$CurrencyEntityImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      baseCode: null == baseCode
          ? _value.baseCode
          : baseCode // ignore: cast_nullable_to_non_nullable
              as String,
      targetCode: null == targetCode
          ? _value.targetCode
          : targetCode // ignore: cast_nullable_to_non_nullable
              as String,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      conversionResult: null == conversionResult
          ? _value.conversionResult
          : conversionResult // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyEntityImpl implements _CurrencyEntity {
  const _$CurrencyEntityImpl(
      {required this.result,
      required this.baseCode,
      required this.targetCode,
      required this.conversionRate,
      required this.conversionResult});

  factory _$CurrencyEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyEntityImplFromJson(json);

  @override
  final String result;
  @override
  final String baseCode;
  @override
  final String targetCode;
  @override
  final double conversionRate;
  @override
  final double conversionResult;

  @override
  String toString() {
    return 'CurrencyEntity(result: $result, baseCode: $baseCode, targetCode: $targetCode, conversionRate: $conversionRate, conversionResult: $conversionResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyEntityImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.baseCode, baseCode) ||
                other.baseCode == baseCode) &&
            (identical(other.targetCode, targetCode) ||
                other.targetCode == targetCode) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate) &&
            (identical(other.conversionResult, conversionResult) ||
                other.conversionResult == conversionResult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, baseCode, targetCode,
      conversionRate, conversionResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyEntityImplCopyWith<_$CurrencyEntityImpl> get copyWith =>
      __$$CurrencyEntityImplCopyWithImpl<_$CurrencyEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyEntityImplToJson(
      this,
    );
  }
}

abstract class _CurrencyEntity implements CurrencyEntity {
  const factory _CurrencyEntity(
      {required final String result,
      required final String baseCode,
      required final String targetCode,
      required final double conversionRate,
      required final double conversionResult}) = _$CurrencyEntityImpl;

  factory _CurrencyEntity.fromJson(Map<String, dynamic> json) =
      _$CurrencyEntityImpl.fromJson;

  @override
  String get result;
  @override
  String get baseCode;
  @override
  String get targetCode;
  @override
  double get conversionRate;
  @override
  double get conversionResult;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyEntityImplCopyWith<_$CurrencyEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
