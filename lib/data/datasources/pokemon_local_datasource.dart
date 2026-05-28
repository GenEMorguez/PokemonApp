// lib/data/datasources/pokemon_local_datasource.dart

import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

abstract class PokemonLocalDataSource {
  Future<List<String>> getFavorites();
  Future<void> saveFavorite(String pokemonName);
  Future<void> removeFavorite(String pokemonName);
  Future<bool> isFavorite(String pokemonName);
  Future<bool> getDarkMode();
  Future<void> setDarkMode(bool isDark);
}

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final SharedPreferences _prefs;
  const PokemonLocalDataSourceImpl(this._prefs);

  @override
  Future<List<String>> getFavorites() async {
    return _prefs.getStringList(AppConstants.favoritesKey) ?? [];
  }

  @override
  Future<void> saveFavorite(String pokemonName) async {
    final favorites = await getFavorites();
    if (!favorites.contains(pokemonName)) {
      favorites.add(pokemonName);
      await _prefs.setStringList(AppConstants.favoritesKey, favorites);
    }
  }

  @override
  Future<void> removeFavorite(String pokemonName) async {
    final favorites = await getFavorites();
    favorites.remove(pokemonName);
    await _prefs.setStringList(AppConstants.favoritesKey, favorites);
  }

  @override
  Future<bool> isFavorite(String pokemonName) async {
    final favorites = await getFavorites();
    return favorites.contains(pokemonName);
  }

  @override
  Future<bool> getDarkMode() async {
    return _prefs.getBool(AppConstants.themeKey) ?? false;
  }

  @override
  Future<void> setDarkMode(bool isDark) async {
    await _prefs.setBool(AppConstants.themeKey, isDark);
  }
}
