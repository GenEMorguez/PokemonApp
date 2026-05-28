// lib/data/models/pokemon_model.dart
// Ejecutar: flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

// ─── Respuesta de lista ──────────────────────────────────────────────────────

@freezed
class PokemonListResponseModel with _$PokemonListResponseModel {
  const factory PokemonListResponseModel({
    required int count,
    String? next,
    String? previous,
    required List<PokemonListItemModel> results,
  }) = _PokemonListResponseModel;

  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseModelFromJson(json);
}

@freezed
class PokemonListItemModel with _$PokemonListItemModel {
  const factory PokemonListItemModel({
    required String name,
    required String url,
  }) = _PokemonListItemModel;

  factory PokemonListItemModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemModelFromJson(json);
}

extension PokemonListItemModelX on PokemonListItemModel {
  int get id {
    final segments = Uri.parse(url).pathSegments;
    return int.parse(segments.lastWhere((s) => s.isNotEmpty));
  }

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}

// ─── Detalle ─────────────────────────────────────────────────────────────────

@freezed
class PokemonDetailModel with _$PokemonDetailModel {
  const factory PokemonDetailModel({
    required int id,
    required String name,
    @JsonKey(name: 'base_experience') @Default(0) int baseExperience,
    required int height,
    required int weight,
    required List<PokemonTypeSlotModel> types,
    required List<PokemonStatSlotModel> stats,
    required List<PokemonAbilitySlotModel> abilities,
    required PokemonSpritesModel sprites,
  }) = _PokemonDetailModel;

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);
}

extension PokemonDetailModelX on PokemonDetailModel {
  String get officialArtwork =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  String get primaryType => types.isNotEmpty ? types.first.type.name : 'normal';
  double get heightInMeters => height / 10;
  double get weightInKg => weight / 10;
}

// ─── Tipos ───────────────────────────────────────────────────────────────────

@freezed
class PokemonTypeSlotModel with _$PokemonTypeSlotModel {
  const factory PokemonTypeSlotModel({
    required int slot,
    required PokemonNamedResourceModel type,
  }) = _PokemonTypeSlotModel;

  factory PokemonTypeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotModelFromJson(json);
}

// ─── Stats ───────────────────────────────────────────────────────────────────

@freezed
class PokemonStatSlotModel with _$PokemonStatSlotModel {
  const factory PokemonStatSlotModel({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required PokemonNamedResourceModel stat,
  }) = _PokemonStatSlotModel;

  factory PokemonStatSlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatSlotModelFromJson(json);
}

// ─── Habilidades ─────────────────────────────────────────────────────────────

@freezed
class PokemonAbilitySlotModel with _$PokemonAbilitySlotModel {
  const factory PokemonAbilitySlotModel({
    @JsonKey(name: 'is_hidden') required bool isHidden,
    required int slot,
    required PokemonNamedResourceModel ability,
  }) = _PokemonAbilitySlotModel;

  factory PokemonAbilitySlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitySlotModelFromJson(json);
}

// ─── Recurso genérico ────────────────────────────────────────────────────────

@freezed
class PokemonNamedResourceModel with _$PokemonNamedResourceModel {
  const factory PokemonNamedResourceModel({
    required String name,
    required String url,
  }) = _PokemonNamedResourceModel;

  factory PokemonNamedResourceModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonNamedResourceModelFromJson(json);
}

// ─── Sprites ─────────────────────────────────────────────────────────────────

@freezed
class PokemonSpritesModel with _$PokemonSpritesModel {
  const factory PokemonSpritesModel({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
  }) = _PokemonSpritesModel;

  factory PokemonSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesModelFromJson(json);
}
