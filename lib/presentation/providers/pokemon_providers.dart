// lib/presentation/providers/pokemon_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../data/datasources/pokemon_remote_datasource.dart';
import '../../data/datasources/pokemon_local_datasource.dart';
import '../../data/repositories/pokemon_repository_impl.dart';

export '../../data/repositories/pokemon_repository_impl.dart'
    show PokemonEntity, PokemonDetailEntity, StatEntity, PokemonRepository;

// ─── Infrastructure providers ────────────────────────────────────────────────

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override en main.dart con ProviderScope');
});

final dioProvider = Provider<Dio>((ref) => DioClient.create());

final remoteDataSourceProvider = Provider<PokemonRemoteDataSource>(
  (ref) => PokemonRemoteDataSourceImpl(ref.watch(dioProvider)),
);

final localDataSourceProvider = Provider<PokemonLocalDataSource>(
  (ref) => PokemonLocalDataSourceImpl(ref.watch(sharedPreferencesProvider)),
);

final pokemonRepositoryProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepositoryImpl(
    remote: ref.watch(remoteDataSourceProvider),
    local: ref.watch(localDataSourceProvider),
  ),
);

// ─── Theme ───────────────────────────────────────────────────────────────────

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier(ref.watch(pokemonRepositoryProvider));
});

class ThemeNotifier extends StateNotifier<bool> {
  final PokemonRepository _repository;
  ThemeNotifier(this._repository) : super(false) {
    _load();
  }
  Future<void> _load() async {
    state = await _repository.getDarkMode();
  }
  Future<void> toggle() async {
    state = !state;
    await _repository.setDarkMode(state);
  }
}

// ─── Pokemon list ─────────────────────────────────────────────────────────────

class PokemonListState {
  final List<PokemonEntity> pokemons;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;
  final int currentOffset;

  const PokemonListState({
    this.pokemons = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.error,
    this.currentOffset = 0,
  });

  PokemonListState copyWith({
    List<PokemonEntity>? pokemons,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    int? currentOffset,
  }) =>
      PokemonListState(
        pokemons: pokemons ?? this.pokemons,
        isLoading: isLoading ?? this.isLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        hasMore: hasMore ?? this.hasMore,
        error: error,
        currentOffset: currentOffset ?? this.currentOffset,
      );
}

final pokemonListProvider =
    StateNotifierProvider<PokemonListNotifier, PokemonListState>(
  (ref) => PokemonListNotifier(ref.watch(pokemonRepositoryProvider)),
);

class PokemonListNotifier extends StateNotifier<PokemonListState> {
  final PokemonRepository _repository;

  PokemonListNotifier(this._repository) : super(const PokemonListState()) {
    loadInitial();
  }

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.getPokemonList(offset: 0);
      state = state.copyWith(
        pokemons: result.pokemons,
        isLoading: false,
        hasMore: result.hasMore,
        currentOffset: result.pokemons.length,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;
    state = state.copyWith(isLoadingMore: true);
    try {
      final result =
          await _repository.getPokemonList(offset: state.currentOffset);
      state = state.copyWith(
        pokemons: [...state.pokemons, ...result.pokemons],
        isLoadingMore: false,
        hasMore: result.hasMore,
        currentOffset: state.currentOffset + result.pokemons.length,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  Future<void> refresh() => loadInitial();
}

// ─── Search ───────────────────────────────────────────────────────────────────

class SearchState {
  final List<PokemonEntity> results;
  final bool isLoading;
  final String? error;
  final String query;

  const SearchState({
    this.results = const [],
    this.isLoading = false,
    this.error,
    this.query = '',
  });

  SearchState copyWith({
    List<PokemonEntity>? results,
    bool? isLoading,
    String? error,
    String? query,
  }) =>
      SearchState(
        results: results ?? this.results,
        isLoading: isLoading ?? this.isLoading,
        error: error,
        query: query ?? this.query,
      );
}

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(ref.watch(pokemonRepositoryProvider)),
);

class SearchNotifier extends StateNotifier<SearchState> {
  final PokemonRepository _repository;
  SearchNotifier(this._repository) : super(const SearchState());

  Future<void> searchByName(String query) async {
    if (query.isEmpty) {
      state = const SearchState();
      return;
    }
    state = state.copyWith(isLoading: true, query: query, error: null);
    try {
      final results = await _repository.searchByName(query);
      state = state.copyWith(
        results: results,
        isLoading: false,
        error: results.isEmpty ? 'No se encontró ningún Pokémon' : null,
      );
    } catch (e) {
      state = state.copyWith(
          isLoading: false, error: 'No se encontró ningún Pokémon');
    }
  }

  Future<void> searchByType(String type) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final results = await _repository.searchByType(type);
      state = state.copyWith(results: results, isLoading: false);
    } catch (e) {
      state =
          state.copyWith(isLoading: false, error: 'Error al buscar por tipo');
    }
  }

  void clear() => state = const SearchState();
}

// ─── Favorites ────────────────────────────────────────────────────────────────

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>(
  (ref) => FavoritesNotifier(ref.watch(pokemonRepositoryProvider)),
);

class FavoritesNotifier extends StateNotifier<List<String>> {
  final PokemonRepository _repository;
  FavoritesNotifier(this._repository) : super([]) {
    _load();
  }
  Future<void> _load() async {
    state = await _repository.getFavorites();
  }
  Future<void> toggle(String pokemonName) async {
    await _repository.toggleFavorite(pokemonName);
    await _load();
  }
  bool isFavorite(String pokemonName) => state.contains(pokemonName);
}

// ─── Detail ───────────────────────────────────────────────────────────────────

final pokemonDetailProvider =
    FutureProvider.family<PokemonDetailEntity, String>((ref, nameOrId) async {
  return ref.watch(pokemonRepositoryProvider).getPokemonDetail(nameOrId);
});
