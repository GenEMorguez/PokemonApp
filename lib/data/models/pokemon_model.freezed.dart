// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonListResponseModel _$PokemonListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonListResponseModel {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PokemonListItemModel> get results => throw _privateConstructorUsedError;

  /// Serializes this PokemonListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListResponseModelCopyWith<PokemonListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListResponseModelCopyWith<$Res> {
  factory $PokemonListResponseModelCopyWith(PokemonListResponseModel value,
          $Res Function(PokemonListResponseModel) then) =
      _$PokemonListResponseModelCopyWithImpl<$Res, PokemonListResponseModel>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<PokemonListItemModel> results});
}

/// @nodoc
class _$PokemonListResponseModelCopyWithImpl<$Res,
        $Val extends PokemonListResponseModel>
    implements $PokemonListResponseModelCopyWith<$Res> {
  _$PokemonListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListResponseModelImplCopyWith<$Res>
    implements $PokemonListResponseModelCopyWith<$Res> {
  factory _$$PokemonListResponseModelImplCopyWith(
          _$PokemonListResponseModelImpl value,
          $Res Function(_$PokemonListResponseModelImpl) then) =
      __$$PokemonListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<PokemonListItemModel> results});
}

/// @nodoc
class __$$PokemonListResponseModelImplCopyWithImpl<$Res>
    extends _$PokemonListResponseModelCopyWithImpl<$Res,
        _$PokemonListResponseModelImpl>
    implements _$$PokemonListResponseModelImplCopyWith<$Res> {
  __$$PokemonListResponseModelImplCopyWithImpl(
      _$PokemonListResponseModelImpl _value,
      $Res Function(_$PokemonListResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PokemonListResponseModelImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListResponseModelImpl implements _PokemonListResponseModel {
  const _$PokemonListResponseModelImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<PokemonListItemModel> results})
      : _results = results;

  factory _$PokemonListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListResponseModelImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PokemonListItemModel> _results;
  @override
  List<PokemonListItemModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PokemonListResponseModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListResponseModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListResponseModelImplCopyWith<_$PokemonListResponseModelImpl>
      get copyWith => __$$PokemonListResponseModelImplCopyWithImpl<
          _$PokemonListResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonListResponseModel implements PokemonListResponseModel {
  const factory _PokemonListResponseModel(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<PokemonListItemModel> results}) =
      _$PokemonListResponseModelImpl;

  factory _PokemonListResponseModel.fromJson(Map<String, dynamic> json) =
      _$PokemonListResponseModelImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PokemonListItemModel> get results;

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListResponseModelImplCopyWith<_$PokemonListResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonListItemModel _$PokemonListItemModelFromJson(Map<String, dynamic> json) {
  return _PokemonListItemModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonListItemModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonListItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListItemModelCopyWith<PokemonListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListItemModelCopyWith<$Res> {
  factory $PokemonListItemModelCopyWith(PokemonListItemModel value,
          $Res Function(PokemonListItemModel) then) =
      _$PokemonListItemModelCopyWithImpl<$Res, PokemonListItemModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonListItemModelCopyWithImpl<$Res,
        $Val extends PokemonListItemModel>
    implements $PokemonListItemModelCopyWith<$Res> {
  _$PokemonListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListItemModelImplCopyWith<$Res>
    implements $PokemonListItemModelCopyWith<$Res> {
  factory _$$PokemonListItemModelImplCopyWith(_$PokemonListItemModelImpl value,
          $Res Function(_$PokemonListItemModelImpl) then) =
      __$$PokemonListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonListItemModelImplCopyWithImpl<$Res>
    extends _$PokemonListItemModelCopyWithImpl<$Res, _$PokemonListItemModelImpl>
    implements _$$PokemonListItemModelImplCopyWith<$Res> {
  __$$PokemonListItemModelImplCopyWithImpl(_$PokemonListItemModelImpl _value,
      $Res Function(_$PokemonListItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonListItemModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListItemModelImpl implements _PokemonListItemModel {
  const _$PokemonListItemModelImpl({required this.name, required this.url});

  factory _$PokemonListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListItemModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonListItemModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListItemModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListItemModelImplCopyWith<_$PokemonListItemModelImpl>
      get copyWith =>
          __$$PokemonListItemModelImplCopyWithImpl<_$PokemonListItemModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListItemModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonListItemModel implements PokemonListItemModel {
  const factory _PokemonListItemModel(
      {required final String name,
      required final String url}) = _$PokemonListItemModelImpl;

  factory _PokemonListItemModel.fromJson(Map<String, dynamic> json) =
      _$PokemonListItemModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListItemModelImplCopyWith<_$PokemonListItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonDetailModel _$PokemonDetailModelFromJson(Map<String, dynamic> json) {
  return _PokemonDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_experience')
  int get baseExperience => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  List<PokemonTypeSlotModel> get types => throw _privateConstructorUsedError;
  List<PokemonStatSlotModel> get stats => throw _privateConstructorUsedError;
  List<PokemonAbilitySlotModel> get abilities =>
      throw _privateConstructorUsedError;
  PokemonSpritesModel get sprites => throw _privateConstructorUsedError;

  /// Serializes this PokemonDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailModelCopyWith<PokemonDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailModelCopyWith<$Res> {
  factory $PokemonDetailModelCopyWith(
          PokemonDetailModel value, $Res Function(PokemonDetailModel) then) =
      _$PokemonDetailModelCopyWithImpl<$Res, PokemonDetailModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'base_experience') int baseExperience,
      int height,
      int weight,
      List<PokemonTypeSlotModel> types,
      List<PokemonStatSlotModel> stats,
      List<PokemonAbilitySlotModel> abilities,
      PokemonSpritesModel sprites});

  $PokemonSpritesModelCopyWith<$Res> get sprites;
}

/// @nodoc
class _$PokemonDetailModelCopyWithImpl<$Res, $Val extends PokemonDetailModel>
    implements $PokemonDetailModelCopyWith<$Res> {
  _$PokemonDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExperience = null,
    Object? height = null,
    Object? weight = null,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
    Object? sprites = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseExperience: null == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlotModel>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatSlotModel>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlotModel>,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokemonSpritesModel,
    ) as $Val);
  }

  /// Create a copy of PokemonDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonSpritesModelCopyWith<$Res> get sprites {
    return $PokemonSpritesModelCopyWith<$Res>(_value.sprites, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonDetailModelImplCopyWith<$Res>
    implements $PokemonDetailModelCopyWith<$Res> {
  factory _$$PokemonDetailModelImplCopyWith(_$PokemonDetailModelImpl value,
          $Res Function(_$PokemonDetailModelImpl) then) =
      __$$PokemonDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'base_experience') int baseExperience,
      int height,
      int weight,
      List<PokemonTypeSlotModel> types,
      List<PokemonStatSlotModel> stats,
      List<PokemonAbilitySlotModel> abilities,
      PokemonSpritesModel sprites});

  @override
  $PokemonSpritesModelCopyWith<$Res> get sprites;
}

/// @nodoc
class __$$PokemonDetailModelImplCopyWithImpl<$Res>
    extends _$PokemonDetailModelCopyWithImpl<$Res, _$PokemonDetailModelImpl>
    implements _$$PokemonDetailModelImplCopyWith<$Res> {
  __$$PokemonDetailModelImplCopyWithImpl(_$PokemonDetailModelImpl _value,
      $Res Function(_$PokemonDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExperience = null,
    Object? height = null,
    Object? weight = null,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
    Object? sprites = null,
  }) {
    return _then(_$PokemonDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseExperience: null == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlotModel>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatSlotModel>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlotModel>,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokemonSpritesModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonDetailModelImpl implements _PokemonDetailModel {
  const _$PokemonDetailModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'base_experience') this.baseExperience = 0,
      required this.height,
      required this.weight,
      required final List<PokemonTypeSlotModel> types,
      required final List<PokemonStatSlotModel> stats,
      required final List<PokemonAbilitySlotModel> abilities,
      required this.sprites})
      : _types = types,
        _stats = stats,
        _abilities = abilities;

  factory _$PokemonDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  @override
  final int height;
  @override
  final int weight;
  final List<PokemonTypeSlotModel> _types;
  @override
  List<PokemonTypeSlotModel> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<PokemonStatSlotModel> _stats;
  @override
  List<PokemonStatSlotModel> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  final List<PokemonAbilitySlotModel> _abilities;
  @override
  List<PokemonAbilitySlotModel> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  final PokemonSpritesModel sprites;

  @override
  String toString() {
    return 'PokemonDetailModel(id: $id, name: $name, baseExperience: $baseExperience, height: $height, weight: $weight, types: $types, stats: $stats, abilities: $abilities, sprites: $sprites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseExperience, baseExperience) ||
                other.baseExperience == baseExperience) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            (identical(other.sprites, sprites) || other.sprites == sprites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      baseExperience,
      height,
      weight,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_stats),
      const DeepCollectionEquality().hash(_abilities),
      sprites);

  /// Create a copy of PokemonDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailModelImplCopyWith<_$PokemonDetailModelImpl> get copyWith =>
      __$$PokemonDetailModelImplCopyWithImpl<_$PokemonDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDetailModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonDetailModel implements PokemonDetailModel {
  const factory _PokemonDetailModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'base_experience') final int baseExperience,
      required final int height,
      required final int weight,
      required final List<PokemonTypeSlotModel> types,
      required final List<PokemonStatSlotModel> stats,
      required final List<PokemonAbilitySlotModel> abilities,
      required final PokemonSpritesModel sprites}) = _$PokemonDetailModelImpl;

  factory _PokemonDetailModel.fromJson(Map<String, dynamic> json) =
      _$PokemonDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'base_experience')
  int get baseExperience;
  @override
  int get height;
  @override
  int get weight;
  @override
  List<PokemonTypeSlotModel> get types;
  @override
  List<PokemonStatSlotModel> get stats;
  @override
  List<PokemonAbilitySlotModel> get abilities;
  @override
  PokemonSpritesModel get sprites;

  /// Create a copy of PokemonDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailModelImplCopyWith<_$PokemonDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonTypeSlotModel _$PokemonTypeSlotModelFromJson(Map<String, dynamic> json) {
  return _PokemonTypeSlotModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeSlotModel {
  int get slot => throw _privateConstructorUsedError;
  PokemonNamedResourceModel get type => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeSlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeSlotModelCopyWith<PokemonTypeSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeSlotModelCopyWith<$Res> {
  factory $PokemonTypeSlotModelCopyWith(PokemonTypeSlotModel value,
          $Res Function(PokemonTypeSlotModel) then) =
      _$PokemonTypeSlotModelCopyWithImpl<$Res, PokemonTypeSlotModel>;
  @useResult
  $Res call({int slot, PokemonNamedResourceModel type});

  $PokemonNamedResourceModelCopyWith<$Res> get type;
}

/// @nodoc
class _$PokemonTypeSlotModelCopyWithImpl<$Res,
        $Val extends PokemonTypeSlotModel>
    implements $PokemonTypeSlotModelCopyWith<$Res> {
  _$PokemonTypeSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonNamedResourceModel,
    ) as $Val);
  }

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonNamedResourceModelCopyWith<$Res> get type {
    return $PokemonNamedResourceModelCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonTypeSlotModelImplCopyWith<$Res>
    implements $PokemonTypeSlotModelCopyWith<$Res> {
  factory _$$PokemonTypeSlotModelImplCopyWith(_$PokemonTypeSlotModelImpl value,
          $Res Function(_$PokemonTypeSlotModelImpl) then) =
      __$$PokemonTypeSlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, PokemonNamedResourceModel type});

  @override
  $PokemonNamedResourceModelCopyWith<$Res> get type;
}

/// @nodoc
class __$$PokemonTypeSlotModelImplCopyWithImpl<$Res>
    extends _$PokemonTypeSlotModelCopyWithImpl<$Res, _$PokemonTypeSlotModelImpl>
    implements _$$PokemonTypeSlotModelImplCopyWith<$Res> {
  __$$PokemonTypeSlotModelImplCopyWithImpl(_$PokemonTypeSlotModelImpl _value,
      $Res Function(_$PokemonTypeSlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$PokemonTypeSlotModelImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonNamedResourceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeSlotModelImpl implements _PokemonTypeSlotModel {
  const _$PokemonTypeSlotModelImpl({required this.slot, required this.type});

  factory _$PokemonTypeSlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeSlotModelImplFromJson(json);

  @override
  final int slot;
  @override
  final PokemonNamedResourceModel type;

  @override
  String toString() {
    return 'PokemonTypeSlotModel(slot: $slot, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeSlotModelImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeSlotModelImplCopyWith<_$PokemonTypeSlotModelImpl>
      get copyWith =>
          __$$PokemonTypeSlotModelImplCopyWithImpl<_$PokemonTypeSlotModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeSlotModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonTypeSlotModel implements PokemonTypeSlotModel {
  const factory _PokemonTypeSlotModel(
          {required final int slot,
          required final PokemonNamedResourceModel type}) =
      _$PokemonTypeSlotModelImpl;

  factory _PokemonTypeSlotModel.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeSlotModelImpl.fromJson;

  @override
  int get slot;
  @override
  PokemonNamedResourceModel get type;

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeSlotModelImplCopyWith<_$PokemonTypeSlotModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonStatSlotModel _$PokemonStatSlotModelFromJson(Map<String, dynamic> json) {
  return _PokemonStatSlotModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonStatSlotModel {
  @JsonKey(name: 'base_stat')
  int get baseStat => throw _privateConstructorUsedError;
  int get effort => throw _privateConstructorUsedError;
  PokemonNamedResourceModel get stat => throw _privateConstructorUsedError;

  /// Serializes this PokemonStatSlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatSlotModelCopyWith<PokemonStatSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatSlotModelCopyWith<$Res> {
  factory $PokemonStatSlotModelCopyWith(PokemonStatSlotModel value,
          $Res Function(PokemonStatSlotModel) then) =
      _$PokemonStatSlotModelCopyWithImpl<$Res, PokemonStatSlotModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      int effort,
      PokemonNamedResourceModel stat});

  $PokemonNamedResourceModelCopyWith<$Res> get stat;
}

/// @nodoc
class _$PokemonStatSlotModelCopyWithImpl<$Res,
        $Val extends PokemonStatSlotModel>
    implements $PokemonStatSlotModelCopyWith<$Res> {
  _$PokemonStatSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_value.copyWith(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokemonNamedResourceModel,
    ) as $Val);
  }

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonNamedResourceModelCopyWith<$Res> get stat {
    return $PokemonNamedResourceModelCopyWith<$Res>(_value.stat, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonStatSlotModelImplCopyWith<$Res>
    implements $PokemonStatSlotModelCopyWith<$Res> {
  factory _$$PokemonStatSlotModelImplCopyWith(_$PokemonStatSlotModelImpl value,
          $Res Function(_$PokemonStatSlotModelImpl) then) =
      __$$PokemonStatSlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      int effort,
      PokemonNamedResourceModel stat});

  @override
  $PokemonNamedResourceModelCopyWith<$Res> get stat;
}

/// @nodoc
class __$$PokemonStatSlotModelImplCopyWithImpl<$Res>
    extends _$PokemonStatSlotModelCopyWithImpl<$Res, _$PokemonStatSlotModelImpl>
    implements _$$PokemonStatSlotModelImplCopyWith<$Res> {
  __$$PokemonStatSlotModelImplCopyWithImpl(_$PokemonStatSlotModelImpl _value,
      $Res Function(_$PokemonStatSlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_$PokemonStatSlotModelImpl(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokemonNamedResourceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatSlotModelImpl implements _PokemonStatSlotModel {
  const _$PokemonStatSlotModelImpl(
      {@JsonKey(name: 'base_stat') required this.baseStat,
      required this.effort,
      required this.stat});

  factory _$PokemonStatSlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatSlotModelImplFromJson(json);

  @override
  @JsonKey(name: 'base_stat')
  final int baseStat;
  @override
  final int effort;
  @override
  final PokemonNamedResourceModel stat;

  @override
  String toString() {
    return 'PokemonStatSlotModel(baseStat: $baseStat, effort: $effort, stat: $stat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatSlotModelImpl &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseStat, effort, stat);

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatSlotModelImplCopyWith<_$PokemonStatSlotModelImpl>
      get copyWith =>
          __$$PokemonStatSlotModelImplCopyWithImpl<_$PokemonStatSlotModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatSlotModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonStatSlotModel implements PokemonStatSlotModel {
  const factory _PokemonStatSlotModel(
          {@JsonKey(name: 'base_stat') required final int baseStat,
          required final int effort,
          required final PokemonNamedResourceModel stat}) =
      _$PokemonStatSlotModelImpl;

  factory _PokemonStatSlotModel.fromJson(Map<String, dynamic> json) =
      _$PokemonStatSlotModelImpl.fromJson;

  @override
  @JsonKey(name: 'base_stat')
  int get baseStat;
  @override
  int get effort;
  @override
  PokemonNamedResourceModel get stat;

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatSlotModelImplCopyWith<_$PokemonStatSlotModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonAbilitySlotModel _$PokemonAbilitySlotModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonAbilitySlotModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonAbilitySlotModel {
  @JsonKey(name: 'is_hidden')
  bool get isHidden => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;
  PokemonNamedResourceModel get ability => throw _privateConstructorUsedError;

  /// Serializes this PokemonAbilitySlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonAbilitySlotModelCopyWith<PokemonAbilitySlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonAbilitySlotModelCopyWith<$Res> {
  factory $PokemonAbilitySlotModelCopyWith(PokemonAbilitySlotModel value,
          $Res Function(PokemonAbilitySlotModel) then) =
      _$PokemonAbilitySlotModelCopyWithImpl<$Res, PokemonAbilitySlotModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_hidden') bool isHidden,
      int slot,
      PokemonNamedResourceModel ability});

  $PokemonNamedResourceModelCopyWith<$Res> get ability;
}

/// @nodoc
class _$PokemonAbilitySlotModelCopyWithImpl<$Res,
        $Val extends PokemonAbilitySlotModel>
    implements $PokemonAbilitySlotModelCopyWith<$Res> {
  _$PokemonAbilitySlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHidden = null,
    Object? slot = null,
    Object? ability = null,
  }) {
    return _then(_value.copyWith(
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as PokemonNamedResourceModel,
    ) as $Val);
  }

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonNamedResourceModelCopyWith<$Res> get ability {
    return $PokemonNamedResourceModelCopyWith<$Res>(_value.ability, (value) {
      return _then(_value.copyWith(ability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonAbilitySlotModelImplCopyWith<$Res>
    implements $PokemonAbilitySlotModelCopyWith<$Res> {
  factory _$$PokemonAbilitySlotModelImplCopyWith(
          _$PokemonAbilitySlotModelImpl value,
          $Res Function(_$PokemonAbilitySlotModelImpl) then) =
      __$$PokemonAbilitySlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_hidden') bool isHidden,
      int slot,
      PokemonNamedResourceModel ability});

  @override
  $PokemonNamedResourceModelCopyWith<$Res> get ability;
}

/// @nodoc
class __$$PokemonAbilitySlotModelImplCopyWithImpl<$Res>
    extends _$PokemonAbilitySlotModelCopyWithImpl<$Res,
        _$PokemonAbilitySlotModelImpl>
    implements _$$PokemonAbilitySlotModelImplCopyWith<$Res> {
  __$$PokemonAbilitySlotModelImplCopyWithImpl(
      _$PokemonAbilitySlotModelImpl _value,
      $Res Function(_$PokemonAbilitySlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHidden = null,
    Object? slot = null,
    Object? ability = null,
  }) {
    return _then(_$PokemonAbilitySlotModelImpl(
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as PokemonNamedResourceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonAbilitySlotModelImpl implements _PokemonAbilitySlotModel {
  const _$PokemonAbilitySlotModelImpl(
      {@JsonKey(name: 'is_hidden') required this.isHidden,
      required this.slot,
      required this.ability});

  factory _$PokemonAbilitySlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonAbilitySlotModelImplFromJson(json);

  @override
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  @override
  final int slot;
  @override
  final PokemonNamedResourceModel ability;

  @override
  String toString() {
    return 'PokemonAbilitySlotModel(isHidden: $isHidden, slot: $slot, ability: $ability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonAbilitySlotModelImpl &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.ability, ability) || other.ability == ability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isHidden, slot, ability);

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonAbilitySlotModelImplCopyWith<_$PokemonAbilitySlotModelImpl>
      get copyWith => __$$PokemonAbilitySlotModelImplCopyWithImpl<
          _$PokemonAbilitySlotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonAbilitySlotModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonAbilitySlotModel implements PokemonAbilitySlotModel {
  const factory _PokemonAbilitySlotModel(
          {@JsonKey(name: 'is_hidden') required final bool isHidden,
          required final int slot,
          required final PokemonNamedResourceModel ability}) =
      _$PokemonAbilitySlotModelImpl;

  factory _PokemonAbilitySlotModel.fromJson(Map<String, dynamic> json) =
      _$PokemonAbilitySlotModelImpl.fromJson;

  @override
  @JsonKey(name: 'is_hidden')
  bool get isHidden;
  @override
  int get slot;
  @override
  PokemonNamedResourceModel get ability;

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonAbilitySlotModelImplCopyWith<_$PokemonAbilitySlotModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonNamedResourceModel _$PokemonNamedResourceModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonNamedResourceModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonNamedResourceModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonNamedResourceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonNamedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonNamedResourceModelCopyWith<PokemonNamedResourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonNamedResourceModelCopyWith<$Res> {
  factory $PokemonNamedResourceModelCopyWith(PokemonNamedResourceModel value,
          $Res Function(PokemonNamedResourceModel) then) =
      _$PokemonNamedResourceModelCopyWithImpl<$Res, PokemonNamedResourceModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonNamedResourceModelCopyWithImpl<$Res,
        $Val extends PokemonNamedResourceModel>
    implements $PokemonNamedResourceModelCopyWith<$Res> {
  _$PokemonNamedResourceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonNamedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonNamedResourceModelImplCopyWith<$Res>
    implements $PokemonNamedResourceModelCopyWith<$Res> {
  factory _$$PokemonNamedResourceModelImplCopyWith(
          _$PokemonNamedResourceModelImpl value,
          $Res Function(_$PokemonNamedResourceModelImpl) then) =
      __$$PokemonNamedResourceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonNamedResourceModelImplCopyWithImpl<$Res>
    extends _$PokemonNamedResourceModelCopyWithImpl<$Res,
        _$PokemonNamedResourceModelImpl>
    implements _$$PokemonNamedResourceModelImplCopyWith<$Res> {
  __$$PokemonNamedResourceModelImplCopyWithImpl(
      _$PokemonNamedResourceModelImpl _value,
      $Res Function(_$PokemonNamedResourceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonNamedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonNamedResourceModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonNamedResourceModelImpl implements _PokemonNamedResourceModel {
  const _$PokemonNamedResourceModelImpl(
      {required this.name, required this.url});

  factory _$PokemonNamedResourceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonNamedResourceModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonNamedResourceModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonNamedResourceModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonNamedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonNamedResourceModelImplCopyWith<_$PokemonNamedResourceModelImpl>
      get copyWith => __$$PokemonNamedResourceModelImplCopyWithImpl<
          _$PokemonNamedResourceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonNamedResourceModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonNamedResourceModel implements PokemonNamedResourceModel {
  const factory _PokemonNamedResourceModel(
      {required final String name,
      required final String url}) = _$PokemonNamedResourceModelImpl;

  factory _PokemonNamedResourceModel.fromJson(Map<String, dynamic> json) =
      _$PokemonNamedResourceModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonNamedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonNamedResourceModelImplCopyWith<_$PokemonNamedResourceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonSpritesModel _$PokemonSpritesModelFromJson(Map<String, dynamic> json) {
  return _PokemonSpritesModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonSpritesModel {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_default')
  String? get backDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_shiny')
  String? get frontShiny => throw _privateConstructorUsedError;

  /// Serializes this PokemonSpritesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpritesModelCopyWith<PokemonSpritesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpritesModelCopyWith<$Res> {
  factory $PokemonSpritesModelCopyWith(
          PokemonSpritesModel value, $Res Function(PokemonSpritesModel) then) =
      _$PokemonSpritesModelCopyWithImpl<$Res, PokemonSpritesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      @JsonKey(name: 'back_default') String? backDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny});
}

/// @nodoc
class _$PokemonSpritesModelCopyWithImpl<$Res, $Val extends PokemonSpritesModel>
    implements $PokemonSpritesModelCopyWith<$Res> {
  _$PokemonSpritesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? backDefault = freezed,
    Object? frontShiny = freezed,
  }) {
    return _then(_value.copyWith(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      backDefault: freezed == backDefault
          ? _value.backDefault
          : backDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonSpritesModelImplCopyWith<$Res>
    implements $PokemonSpritesModelCopyWith<$Res> {
  factory _$$PokemonSpritesModelImplCopyWith(_$PokemonSpritesModelImpl value,
          $Res Function(_$PokemonSpritesModelImpl) then) =
      __$$PokemonSpritesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      @JsonKey(name: 'back_default') String? backDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny});
}

/// @nodoc
class __$$PokemonSpritesModelImplCopyWithImpl<$Res>
    extends _$PokemonSpritesModelCopyWithImpl<$Res, _$PokemonSpritesModelImpl>
    implements _$$PokemonSpritesModelImplCopyWith<$Res> {
  __$$PokemonSpritesModelImplCopyWithImpl(_$PokemonSpritesModelImpl _value,
      $Res Function(_$PokemonSpritesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? backDefault = freezed,
    Object? frontShiny = freezed,
  }) {
    return _then(_$PokemonSpritesModelImpl(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      backDefault: freezed == backDefault
          ? _value.backDefault
          : backDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpritesModelImpl implements _PokemonSpritesModel {
  const _$PokemonSpritesModelImpl(
      {@JsonKey(name: 'front_default') this.frontDefault,
      @JsonKey(name: 'back_default') this.backDefault,
      @JsonKey(name: 'front_shiny') this.frontShiny});

  factory _$PokemonSpritesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpritesModelImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @override
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @override
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @override
  String toString() {
    return 'PokemonSpritesModel(frontDefault: $frontDefault, backDefault: $backDefault, frontShiny: $frontShiny)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpritesModelImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault) &&
            (identical(other.backDefault, backDefault) ||
                other.backDefault == backDefault) &&
            (identical(other.frontShiny, frontShiny) ||
                other.frontShiny == frontShiny));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, frontDefault, backDefault, frontShiny);

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpritesModelImplCopyWith<_$PokemonSpritesModelImpl> get copyWith =>
      __$$PokemonSpritesModelImplCopyWithImpl<_$PokemonSpritesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpritesModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonSpritesModel implements PokemonSpritesModel {
  const factory _PokemonSpritesModel(
          {@JsonKey(name: 'front_default') final String? frontDefault,
          @JsonKey(name: 'back_default') final String? backDefault,
          @JsonKey(name: 'front_shiny') final String? frontShiny}) =
      _$PokemonSpritesModelImpl;

  factory _PokemonSpritesModel.fromJson(Map<String, dynamic> json) =
      _$PokemonSpritesModelImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;
  @override
  @JsonKey(name: 'back_default')
  String? get backDefault;
  @override
  @JsonKey(name: 'front_shiny')
  String? get frontShiny;

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpritesModelImplCopyWith<_$PokemonSpritesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
