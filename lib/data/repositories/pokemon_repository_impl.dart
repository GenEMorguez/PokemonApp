// lib/data/repositories/pokemon_repository_impl.dart

import '../datasources/pokemon_remote_datasource.dart';
import '../datasources/pokemon_local_datasource.dart';
import '../models/pokemon_model.dart';

// ─── Entidades del dominio ────────────────────────────────────────────────────

class PokemonEntity {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
  });
}

class PokemonDetailEntity {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<StatEntity> stats;
  final List<String> abilities;
  final double heightInMeters;
  final double weightInKg;
  final int baseExperience;

  const PokemonDetailEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.heightInMeters,
    required this.weightInKg,
    required this.baseExperience,
  });
}

class StatEntity {
  final String name;
  final int value;
  const StatEntity({required this.name, required this.value});

  String get displayName {
    const names = {
      'hp': 'HP',
      'attack': 'Ataque',
      'defense': 'Defensa',
      'special-attack': 'Sp. Ataque',
      'special-defense': 'Sp. Defensa',
      'speed': 'Velocidad',
    };
    return names[name] ?? name;
  }
}

// ─── Contrato (interfaz) ─────────────────────────────────────────────────────

abstract class PokemonRepository {
  Future<({List<PokemonEntity> pokemons, bool hasMore})> getPokemonList({
    required int offset,
  });
  Future<PokemonDetailEntity> getPokemonDetail(String nameOrId);
  Future<List<PokemonEntity>> searchByName(String query);
  Future<List<PokemonEntity>> searchByType(String type);
  Future<List<String>> getFavorites();
  Future<void> toggleFavorite(String pokemonName);
  Future<bool> isFavorite(String pokemonName);
  Future<bool> getDarkMode();
  Future<void> setDarkMode(bool isDark);
}

// ─── Implementación ──────────────────────────────────────────────────────────

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource _remote;
  final PokemonLocalDataSource _local;

  const PokemonRepositoryImpl({
    required PokemonRemoteDataSource remote,
    required PokemonLocalDataSource local,
  })  : _remote = remote,
        _local = local;

  @override
  Future<({List<PokemonEntity> pokemons, bool hasMore})> getPokemonList({
    required int offset,
  }) async {
    final response = await _remote.getPokemonList(offset: offset);
    final pokemons = response.results.map((item) {
      return PokemonEntity(
        id: item.id,
        name: item.name,
        imageUrl: item.imageUrl,
        types: [],
      );
    }).toList();
    return (pokemons: pokemons, hasMore: response.next != null);
  }

  @override
  Future<PokemonDetailEntity> getPokemonDetail(String nameOrId) async {
    final detail = await _remote.getPokemonDetail(nameOrId);
    return PokemonDetailEntity(
      id: detail.id,
      name: detail.name,
      imageUrl: detail.officialArtwork,
      types: detail.types.map((t) => t.type.name).toList(),
      stats: detail.stats
          .map((s) => StatEntity(name: s.stat.name, value: s.baseStat))
          .toList(),
      abilities: detail.abilities.map((a) => a.ability.name).toList(),
      heightInMeters: detail.heightInMeters,
      weightInKg: detail.weightInKg,
      baseExperience: detail.baseExperience,
    );
  }

  @override
  Future<List<PokemonEntity>> searchByName(String query) async {
    try {
      final entity = await getPokemonDetail(query.toLowerCase().trim());
      return [
        PokemonEntity(
          id: entity.id,
          name: entity.name,
          imageUrl: entity.imageUrl,
          types: entity.types,
        )
      ];
    } catch (_) {
      return [];
    }
  }

  @override
  Future<List<PokemonEntity>> searchByType(String type) async {
    final items = await _remote.searchPokemonByType(type);
    return items.take(40).map((item) {
      return PokemonEntity(
        id: item.id,
        name: item.name,
        imageUrl: item.imageUrl,
        types: [type],
      );
    }).toList();
  }

  @override
  Future<List<String>> getFavorites() => _local.getFavorites();

  @override
  Future<void> toggleFavorite(String pokemonName) async {
    final isFav = await _local.isFavorite(pokemonName);
    if (isFav) {
      await _local.removeFavorite(pokemonName);
    } else {
      await _local.saveFavorite(pokemonName);
    }
  }

  @override
  Future<bool> isFavorite(String pokemonName) =>
      _local.isFavorite(pokemonName);

  @override
  Future<bool> getDarkMode() => _local.getDarkMode();

  @override
  Future<void> setDarkMode(bool isDark) => _local.setDarkMode(isDark);
}
