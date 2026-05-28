// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonListResponseModelImpl _$$PokemonListResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonListResponseModelImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonListResponseModelImplToJson(
        _$PokemonListResponseModelImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$PokemonListItemModelImpl _$$PokemonListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonListItemModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonListItemModelImplToJson(
        _$PokemonListItemModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonDetailModelImpl _$$PokemonDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonDetailModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['base_experience'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) =>
              PokemonAbilitySlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites:
          PokemonSpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonDetailModelImplToJson(
        _$PokemonDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'stats': instance.stats,
      'abilities': instance.abilities,
      'sprites': instance.sprites,
    };

_$PokemonTypeSlotModelImpl _$$PokemonTypeSlotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonTypeSlotModelImpl(
      slot: (json['slot'] as num).toInt(),
      type: PokemonNamedResourceModel.fromJson(
          json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonTypeSlotModelImplToJson(
        _$PokemonTypeSlotModelImpl instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

_$PokemonStatSlotModelImpl _$$PokemonStatSlotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatSlotModelImpl(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: PokemonNamedResourceModel.fromJson(
          json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonStatSlotModelImplToJson(
        _$PokemonStatSlotModelImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_$PokemonAbilitySlotModelImpl _$$PokemonAbilitySlotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonAbilitySlotModelImpl(
      isHidden: json['is_hidden'] as bool,
      slot: (json['slot'] as num).toInt(),
      ability: PokemonNamedResourceModel.fromJson(
          json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonAbilitySlotModelImplToJson(
        _$PokemonAbilitySlotModelImpl instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };

_$PokemonNamedResourceModelImpl _$$PokemonNamedResourceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonNamedResourceModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonNamedResourceModelImplToJson(
        _$PokemonNamedResourceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonSpritesModelImpl _$$PokemonSpritesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonSpritesModelImpl(
      frontDefault: json['front_default'] as String?,
      backDefault: json['back_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );

Map<String, dynamic> _$$PokemonSpritesModelImplToJson(
        _$PokemonSpritesModelImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'back_default': instance.backDefault,
      'front_shiny': instance.frontShiny,
    };
