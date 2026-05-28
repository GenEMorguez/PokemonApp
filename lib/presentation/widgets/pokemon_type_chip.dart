// lib/presentation/widgets/pokemon_type_chip.dart

import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class PokemonTypeChip extends StatelessWidget {
  final String type;
  final bool large;

  const PokemonTypeChip({super.key, required this.type, this.large = false});

  @override
  Widget build(BuildContext context) {
    final colorInt = AppConstants.typeColors[type] ?? 0xFFBCBCBC;
    final color = Color(colorInt);
    final label = type[0].toUpperCase() + type.substring(1);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 12 : 8,
        vertical: large ? 6 : 3,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.6), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: large ? 13 : 11,
          fontWeight: FontWeight.bold,
          color: _darken(color, 0.25),
        ),
      ),
    );
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
