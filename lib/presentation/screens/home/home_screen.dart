// lib/presentation/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../providers/pokemon_providers.dart';
import '../../widgets/pokemon_type_chip.dart';
import '../../../core/constants/app_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      ref.read(pokemonListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pokemonListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.catching_pokemon, color: Colors.white, size: 28),
            const SizedBox(width: 8),
            const Text('Pokédex', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.push('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => context.push('/favorites'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(PokemonListState state) {
    if (state.isLoading) return _buildShimmerGrid();

    if (state.error != null && state.pokemons.isEmpty) {
      return _buildError(state.error!);
    }

    return RefreshIndicator(
      color: const Color(0xFFCC0000),
      onRefresh: () => ref.read(pokemonListProvider.notifier).refresh(),
      child: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: state.pokemons.length + (state.isLoadingMore ? 2 : 0),
        itemBuilder: (context, index) {
          if (index >= state.pokemons.length) {
            return _buildShimmerCard();
          }
          final pokemon = state.pokemons[index];
          return _PokemonCard(pokemon: pokemon, index: index);
        },
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: 10,
      itemBuilder: (_, __) => _buildShimmerCard(),
    );
  }

  Widget _buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('😵', style: TextStyle(fontSize: 60)),
          const SizedBox(height: 16),
          Text(
            error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.read(pokemonListProvider.notifier).refresh(),
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}

class _PokemonCard extends ConsumerWidget {
  final PokemonEntity pokemon;
  final int index;

  const _PokemonCard({required this.pokemon, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref
        .watch(favoritesProvider.notifier)
        .isFavorite(pokemon.name);

    final primaryType = pokemon.types.isNotEmpty ? pokemon.types.first : 'normal';
    final cardColor = Color(
      AppConstants.typeColors[primaryType] ?? 0xFFBCBCBC,
    ).withOpacity(0.2);

    return GestureDetector(
      onTap: () => context.push('/detail/${pokemon.name}'),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [cardColor, cardColor.withOpacity(0.05)],
            ),
          ),
          child: Stack(
            children: [
              // Pokéball decorativa de fondo
              Positioned(
                right: -20,
                bottom: -20,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    Icons.catching_pokemon,
                    size: 100,
                    color: Colors.black,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Número del Pokédex
                    Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),

                    // Imagen
                    Expanded(
                      child: Center(
                        child: Hero(
                          tag: 'pokemon-${pokemon.name}',
                          child: CachedNetworkImage(
                            imageUrl: pokemon.imageUrl,
                            fit: BoxFit.contain,
                            placeholder: (_, __) => const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            errorWidget: (_, __, ___) => const Icon(
                              Icons.catching_pokemon,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Nombre
                    Text(
                      _capitalize(pokemon.name),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Tipos
                    if (pokemon.types.isNotEmpty)
                      Wrap(
                        spacing: 4,
                        children: pokemon.types
                            .map((t) => PokemonTypeChip(type: t))
                            .toList(),
                      ),
                  ],
                ),
              ),

              // Botón favorito
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () =>
                      ref.read(favoritesProvider.notifier).toggle(pokemon.name),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(delay: (index * 50).ms)
        .fadeIn(duration: 300.ms)
        .slideY(begin: 0.1, end: 0);
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}
