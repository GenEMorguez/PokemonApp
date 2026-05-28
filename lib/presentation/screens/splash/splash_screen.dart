// lib/presentation/screens/splash/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Navegar al Home después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCC0000),
      body: Stack(
        children: [
          // Línea horizontal de la Pokéball
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 1,
            left: 0,
            right: 0,
            child: Container(height: 4, color: Colors.black),
          ),

          // Mitad inferior (blanca)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(color: Colors.white),
          ),

          // Contenido centrado
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pokéball giratoria
                RotationTransition(
                  turns: _rotationController,
                  child: _PokeballWidget(size: 120),
                )
                    .animate()
                    .scale(
                      begin: const Offset(0, 0),
                      end: const Offset(1, 1),
                      duration: 600.ms,
                      curve: Curves.elasticOut,
                    ),

                const SizedBox(height: 32),

                // Título
                const Text(
                  'Pokédex',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCC0000),
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                )
                    .animate(delay: 300.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.3, end: 0),

                const SizedBox(height: 8),

                const Text(
                  'Gotta catch \'em all!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    letterSpacing: 1,
                  ),
                )
                    .animate(delay: 600.ms)
                    .fadeIn(duration: 500.ms),

                const SizedBox(height: 48),

                // Indicador de carga
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFCC0000)),
                    strokeWidth: 3,
                  ),
                ).animate(delay: 800.ms).fadeIn(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PokeballWidget extends StatelessWidget {
  final double size;
  const _PokeballWidget({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: CustomPaint(
        painter: _PokeballPainter(),
      ),
    );
  }
}

class _PokeballPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Mitad roja (arriba)
    final redPaint = Paint()..color = const Color(0xFFCC0000);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159,
      3.14159,
      true,
      redPaint,
    );

    // Mitad blanca (abajo)
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      3.14159,
      true,
      whitePaint,
    );

    // Línea negra central
    final blackLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      blackLinePaint,
    );

    // Círculo exterior negro del botón central
    final outerCirclePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.2, outerCirclePaint);

    // Círculo interior blanco del botón central
    final innerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.12, innerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
