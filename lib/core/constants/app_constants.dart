// lib/core/constants/app_constants.dart

class AppConstants {
  AppConstants._();

  // API
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static const int pageSize = 20;
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // SharedPreferences keys
  static const String themeKey = 'is_dark_mode';
  static const String favoritesKey = 'favorites_list';

  // Assets
  static const String pokeballAsset = 'assets/images/pokeball.png';

  // Tipos de Pokémon (para chips de color)
  static const Map<String, int> typeColors = {
    'fire': 0xFFFF6B35,
    'water': 0xFF4FC3F7,
    'grass': 0xFF66BB6A,
    'electric': 0xFFFFD54F,
    'psychic': 0xFFF48FB1,
    'ice': 0xFF80DEEA,
    'dragon': 0xFF7E57C2,
    'dark': 0xFF546E7A,
    'fairy': 0xFFF8BBD9,
    'fighting': 0xFFEF5350,
    'poison': 0xFFAB47BC,
    'ground': 0xFFD4A574,
    'flying': 0xFF90CAF9,
    'bug': 0xFFA5D6A7,
    'rock': 0xFFBCAAA4,
    'ghost': 0xFF7E57C2,
    'steel': 0xFF90A4AE,
    'normal': 0xFFBCBCBC,
  };
}
