// lib/presentation/screens/search/search_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/pokemon_providers.dart';

const _pokemonTypes = [
  'fire', 'water', 'grass', 'electric', 'psychic', 'ice',
  'dragon', 'dark', 'fairy', 'fighting', 'poison', 'ground',
  'flying', 'bug', 'rock', 'ghost', 'steel', 'normal',
];

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  String? _selectedType;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Pokémon')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Nombre del Pokémon (ej: pikachu)',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          ref.read(searchProvider.notifier).clear();
                          setState(() => _selectedType = null);
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (value) {
                setState(() => _selectedType = null);
                ref.read(searchProvider.notifier).searchByName(value);
              },
              onChanged: (_) => setState(() {}),
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _pokemonTypes.length,
              itemBuilder: (context, index) {
                final type = _pokemonTypes[index];
                final isSelected = _selectedType == type;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(type[0].toUpperCase() + type.substring(1)),
                    selected: isSelected,
                    selectedColor:
                        Color(AppConstants.typeColors[type] ?? 0xFFBCBCBC)
                            .withOpacity(0.4),
                    onSelected: (selected) {
                      setState(() {
                        _selectedType = selected ? type : null;
                        _controller.clear();
                      });
                      if (selected) {
                        ref.read(searchProvider.notifier).searchByType(type);
                      } else {
                        ref.read(searchProvider.notifier).clear();
                      }
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _buildResults(state)),
        ],
      ),
    );
  }

  Widget _buildResults(SearchState state) {
    if (state.isLoading) {
      return const Center(
          child: CircularProgressIndicator(color: Color(0xFFCC0000)));
    }
    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🔍', style: TextStyle(fontSize: 60)),
            const SizedBox(height: 16),
            Text(state.error!),
          ],
        ),
      );
    }
    if (state.results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🔎', style: TextStyle(fontSize: 60)),
            SizedBox(height: 16),
            Text('Busca por nombre o filtra por tipo'),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: state.results.length,
      itemBuilder: (context, index) {
        final pokemon = state.results[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.contain,
            ),
            title: Text(
              pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('#${pokemon.id.toString().padLeft(3, '0')}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/detail/${pokemon.name}'),
          ),
        );
      },
    );
  }
}
