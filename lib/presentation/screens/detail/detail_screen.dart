// lib/presentation/screens/detail/detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../providers/pokemon_providers.dart';
import '../../widgets/pokemon_type_chip.dart';
import '../../../core/constants/app_constants.dart';

class DetailScreen extends ConsumerWidget {
  final String pokemonName;

  const DetailScreen({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(pokemonDetailProvider(pokemonName));
    final isFavorite =
        ref.watch(favoritesProvider.notifier).isFavorite(pokemonName);

    return detailAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('😵', style: TextStyle(fontSize: 60)),
              const SizedBox(height: 16),
              Text(error.toString()),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(pokemonDetailProvider(pokemonName)),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      ),
      data: (pokemon) {
        final primaryType =
            pokemon.types.isNotEmpty ? pokemon.types.first : 'normal';
        final typeColorInt =
            AppConstants.typeColors[primaryType] ?? 0xFFCC0000;
        final typeColor = Color(typeColorInt);

        return Scaffold(
          backgroundColor: typeColor.withOpacity(0.15),
          body: CustomScrollView(
            slivers: [
              // AppBar con imagen Hero
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                backgroundColor: typeColor,
                foregroundColor: Colors.white,
                actions: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        ref.read(favoritesProvider.notifier).toggle(pokemonName),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    _capitalize(pokemon.name),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 4, color: Colors.black38)],
                    ),
                  ),
                  background: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Pokéball de fondo
                      Positioned(
                        right: -40,
                        bottom: -40,
                        child: Opacity(
                          opacity: 0.15,
                          child: Icon(
                            Icons.catching_pokemon,
                            size: 200,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Imagen del Pokémon
                      Positioned(
                        bottom: 40,
                        child: Hero(
                          tag: 'pokemon-${pokemon.name}',
                          child: CachedNetworkImage(
                            imageUrl: pokemon.imageUrl,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Contenido
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Número y tipos
                      Row(
                        children: [
                          Text(
                            '#${pokemon.id.toString().padLeft(3, '0')}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Spacer(),
                          ...pokemon.types.map(
                            (t) => Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: PokemonTypeChip(type: t, large: true),
                            ),
                          ),
                        ],
                      ).animate().fadeIn(duration: 400.ms),

                      const SizedBox(height: 20),

                      // Info básica
                      _InfoRow(pokemon: pokemon, typeColor: typeColor)
                          .animate(delay: 100.ms)
                          .fadeIn(duration: 400.ms)
                          .slideY(begin: 0.1, end: 0),

                      const SizedBox(height: 20),

                      // Habilidades
                      _SectionTitle(title: 'Habilidades', color: typeColor),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: pokemon.abilities
                            .map(
                              (ability) => Chip(
                                label: Text(_capitalize(ability)),
                                backgroundColor: typeColor.withOpacity(0.15),
                              ),
                            )
                            .toList(),
                      ).animate(delay: 200.ms).fadeIn(duration: 400.ms),

                      const SizedBox(height: 20),

                      // Estadísticas base
                      _SectionTitle(title: 'Estadísticas Base', color: typeColor),
                      const SizedBox(height: 12),
                      ...pokemon.stats.asMap().entries.map(
                            (entry) => _StatBar(
                              stat: entry.value,
                              color: typeColor,
                              animationDelay: 300 + (entry.key * 80),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

class _InfoRow extends StatelessWidget {
  final PokemonDetailEntity pokemon;
  final Color typeColor;

  const _InfoRow({required this.pokemon, required this.typeColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _InfoItem(
              icon: Icons.height,
              label: 'Altura',
              value: '${pokemon.heightInMeters.toStringAsFixed(1)} m',
              color: typeColor,
            ),
            _divider(),
            _InfoItem(
              icon: Icons.monitor_weight,
              label: 'Peso',
              value: '${pokemon.weightInKg.toStringAsFixed(1)} kg',
              color: typeColor,
            ),
            _divider(),
            _InfoItem(
              icon: Icons.star,
              label: 'Exp. Base',
              value: '${pokemon.baseExperience}',
              color: typeColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Container(
        height: 40,
        width: 1,
        color: Colors.grey[300],
      );
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final Color color;

  const _SectionTitle({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _StatBar extends StatefulWidget {
  final StatEntity stat;
  final Color color;
  final int animationDelay;

  const _StatBar({
    required this.stat,
    required this.color,
    required this.animationDelay,
  });

  @override
  State<_StatBar> createState() => _StatBarState();
}

class _StatBarState extends State<_StatBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.stat.value / 255.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(Duration(milliseconds: widget.animationDelay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              widget.stat.displayName,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              '${widget.stat.value}',
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (_, __) => ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: _animation.value,
                  minHeight: 8,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getStatColor(widget.stat.value),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatColor(int value) {
    if (value >= 100) return Colors.green;
    if (value >= 60) return Colors.orange;
    return Colors.red;
  }
}
