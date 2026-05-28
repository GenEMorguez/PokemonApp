// lib/presentation/screens/favorites/favorites_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/pokemon_providers.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Favoritos ❤️')),
      body: favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('💔', style: TextStyle(fontSize: 60)),
                  SizedBox(height: 16),
                  Text(
                    'Aún no tienes favoritos.\nAgrega Pokémon desde el detalle.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final name = favorites[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Text(
                        name[0].toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      name[0].toUpperCase() + name.substring(1),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          onPressed: () =>
                              ref.read(favoritesProvider.notifier).toggle(name),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    onTap: () => context.push('/detail/$name'),
                  ),
                );
              },
            ),
    );
  }
}
