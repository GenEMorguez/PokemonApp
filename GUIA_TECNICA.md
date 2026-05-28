# Pokémon Wallpapers App — Guía Técnica

**Proyecto Final · Frameworks de Desarrollo Móvil**
**Framework:** Flutter (Dart) · **Versión:** 1.0.0

---

## 1. Descripción del Proyecto

App móvil de exploración del mundo Pokémon que consume la **PokéAPI** (`pokeapi.co`). Integra los tres pilares del programa:

- **Navegación** con `go_router`
- **Manejo de estados** con `Riverpod` (StateNotifier)
- **Consumo de API REST** con `Dio`

Temática: reemplaza "Unsplash wallpapers" por Pokémon, manteniendo todos los requisitos técnicos del proyecto original.

---

## 2. Arquitectura: Clean Architecture

```
lib/
├── core/
│   ├── constants/       → app_constants.dart (URL base, keys, type colors)
│   ├── errors/          → failures.dart (Failure, Exception classes)
│   ├── network/         → dio_client.dart, connectivity_service.dart
│   ├── router/          → app_router.dart (go_router config)
│   └── theme/           → app_theme.dart (light/dark theme)
│
├── data/                ← CAPA DE DATOS
│   ├── datasources/
│   │   ├── pokemon_remote_datasource.dart  (llama a PokéAPI con Dio)
│   │   └── pokemon_local_datasource.dart   (SharedPreferences)
│   ├── models/
│   │   └── pokemon_model.dart              (Freezed + JSON serialization)
│   └── repositories/
│       └── pokemon_repository_impl.dart    (implementa contratos)
│
├── domain/              ← CAPA DE DOMINIO (reglas de negocio puras)
│   ├── entities/        → PokemonEntity, PokemonDetailEntity, StatEntity
│   └── repositories/    → PokemonRepository (contrato/interfaz)
│
└── presentation/        ← CAPA DE PRESENTACIÓN
    ├── providers/       → pokemon_providers.dart (Riverpod providers)
    ├── screens/
    │   ├── splash/      → SplashScreen (animación pokéball)
    │   ├── home/        → HomeScreen (grid + lazy loading)
    │   ├── search/      → SearchScreen (nombre + tipo)
    │   ├── detail/      → DetailScreen (stats + hero animation)
    │   ├── favorites/   → FavoritesScreen (persistencia local)
    │   └── settings/    → SettingsScreen (dark/light mode)
    └── widgets/         → PokemonTypeChip, StatBar, etc.
```

---

## 3. Tecnologías y Justificación

| Tecnología | Versión | Para qué sirve |
|---|---|---|
| `flutter_riverpod` | ^2.4.9 | State Management (requerido en el proyecto) |
| `riverpod_annotation` | ^2.3.3 | Generación de providers con `@riverpod` |
| `dio` | ^5.4.0 | Cliente HTTP con interceptores para PokéAPI |
| `retrofit` | ^4.1.0 | Generación de API clients tipo-segura |
| `shared_preferences` | ^2.2.2 | Persistencia de tema y favoritos (requerido) |
| `go_router` | ^13.2.0 | Navegación declarativa con rutas nombradas |
| `cached_network_image` | ^3.3.1 | Caché de imágenes Pokémon |
| `freezed` | ^2.4.6 | Modelos inmutables con copyWith, equality |
| `flutter_animate` | ^4.5.0 | Animaciones de entrada en listas y splash |
| `shimmer` | ^3.0.0 | Skeleton loading mientras carga la lista |
| `connectivity_plus` | ^5.0.2 | Detección de modo offline |

---

## 4. Pantallas

### 4.1 Splash Screen (`/`)
- Pokéball animada con `CustomPainter` + `RotationTransition`
- Fondo rojo/blanco replicando la apariencia de una Pokéball
- Navega automáticamente a `/home` después de 3 segundos
- Animación de entrada del título con `flutter_animate`

### 4.2 Home / Pokédex (`/home`)
- `GridView.builder` 2 columnas con `SliverGridDelegate`
- **Paginación infinita (Lazy Loading)**: detecta cuando el usuario llega al final del scroll (`ScrollController`) y llama `loadMore()`
- `RefreshIndicator` para pull-to-refresh
- `Shimmer` skeleton durante la carga inicial
- Cada card muestra: número, imagen, nombre, tipo(s), botón favorito
- `Hero` animation para transición fluida al detalle

### 4.3 Búsqueda (`/search`)
- **Búsqueda por nombre**: TextField → llama `GET /pokemon/{name}`
- **Filtro por tipo**: chips horizontales → llama `GET /type/{type}`
- Estado vacío, cargando y error manejados con `SearchState`

### 4.4 Detalle (`/detail/:name`)
- `SliverAppBar` con imagen Pokémon en `FlexibleSpaceBar`
- Animación Hero desde la card del grid
- Información: altura, peso, experiencia base
- Habilidades en chips
- **Barras de estadísticas animadas** (cada barra tiene animación independiente)
- Botón de favorito en la AppBar

### 4.5 Favoritos (`/favorites`)
- Lista de Pokémon guardados con `SharedPreferences`
- Botón para quitar de favoritos directamente desde la lista

### 4.6 Configuración (`/settings`)
- Toggle Dark/Light Mode → persiste con `SharedPreferences`
- Sección "Acerca de" con info del proyecto

---

## 5. Manejo de Estados con Riverpod

```dart
// Ejemplo: PokemonListState + StateNotifier
class PokemonListState {
  final List<PokemonEntity> pokemons;
  final bool isLoading;
  final bool isLoadingMore;   // para paginación
  final bool hasMore;         // si hay más páginas
  final String? error;
  final int currentOffset;    // para la siguiente página
}

// Provider
final pokemonListProvider =
    StateNotifierProvider<PokemonListNotifier, PokemonListState>(...);
```

**Providers en el proyecto:**
- `themeProvider` → bool (isDark), persiste en SharedPreferences
- `pokemonListProvider` → lista principal con paginación
- `searchProvider` → resultados de búsqueda
- `favoritesProvider` → lista de nombres favoritos
- `pokemonDetailProvider` → FutureProvider.family por nombre

---

## 6. Consumo de API (PokéAPI)

**Base URL:** `https://pokeapi.co/api/v2`

| Endpoint | Uso |
|---|---|
| `GET /pokemon?limit=20&offset=0` | Lista paginada |
| `GET /pokemon/{name}` | Detalle del Pokémon |
| `GET /type/{type}` | Pokémon por tipo |

**Interceptores de Dio:**
- `_LoggingInterceptor`: logs de cada request/response en debug
- `_ErrorInterceptor`: convierte `DioException` en `Failure` del dominio

---

## 7. Offline Mode y Manejo de Errores

```dart
// ConnectivityService
final isConnected = await connectivityService.isConnected;
if (!isConnected) throw const NetworkFailure();

// En la UI (ejemplo)
state.when(
  loading: () => ShimmerGrid(),
  error: (e, _) => ErrorWidget(message: e.toString(), onRetry: reload),
  data: (list) => PokemonGrid(pokemons: list),
);
```

Jerarquía de errores:
- `NetworkFailure` → sin internet
- `ServerFailure` → error 5xx
- `NotFoundFailure` → error 404 (Pokémon no existe)
- `CacheFailure` → error de SharedPreferences

---

## 8. Persistencia con SharedPreferences

```dart
// Favoritos: lista de nombres
await prefs.setStringList('favorites_list', ['pikachu', 'charizard']);

// Tema
await prefs.setBool('is_dark_mode', true);
```

---

## 9. Configuración Inicial

```bash
# 1. Clonar repositorio
git clone https://github.com/tu-usuario/pokemon-wallpapers-app
cd pokemon-wallpapers-app

# 2. Instalar dependencias
flutter pub get

# 3. Generar código (Freezed, Riverpod, Retrofit)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Ejecutar
flutter run
```

---

## 10. Checklist de Entregables

- [x] Código fuente en GitHub (ZIP o repositorio público)
- [x] Video demostrativo mostrando todas las pantallas
- [x] Navegación funcional entre pantallas (`go_router`)
- [x] Estado global con Riverpod (`StateNotifier`)
- [x] Consumo de API REST (`PokéAPI` con `Dio`)
- [x] Búsqueda por palabra clave y por tipo
- [x] Paginación infinita (Lazy Loading)
- [x] Persistencia de tema con `SharedPreferences`
- [x] Persistencia de favoritos con `SharedPreferences`
- [x] Offline mode con `connectivity_plus`
- [x] Clean Architecture (Data / Domain / Presentation)
- [x] Manejo de excepciones

---

*Datos proporcionados por PokéAPI — https://pokeapi.co (API pública y gratuita)*
