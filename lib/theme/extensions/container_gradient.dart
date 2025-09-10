import 'package:flutter/material.dart';

class ContainerGradients extends ThemeExtension<ContainerGradients> {
  const ContainerGradients({required this.primaryGradient});

  final Gradient primaryGradient;

  static ContainerGradients light(ColorScheme scheme) => const ContainerGradients(
    primaryGradient: LinearGradient(
      colors: [
        Color(0xFFEFF6FF), // light blue-ish
        Color(0xFFFAF5FF), // light purple-ish
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static ContainerGradients dark(ColorScheme scheme) => const ContainerGradients(
    primaryGradient: LinearGradient(
      colors: [
        Color(0xFF0F172A), // deep navy blue
        Color(0xFF6D28D9), // purple-violet
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  @override
  ContainerGradients copyWith({Gradient? primaryGradient}) {
    return ContainerGradients(
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  ContainerGradients lerp(ThemeExtension<ContainerGradients>? other, double t) {
    if (other is! ContainerGradients) return this;
    return ContainerGradients(
      primaryGradient: LinearGradient(
        colors: List.generate(2, (index) {
          final a = (primaryGradient as LinearGradient).colors[index];
          final b = (other.primaryGradient as LinearGradient).colors[index];
          return Color.lerp(a, b, t)!;
        }),
        begin: (primaryGradient as LinearGradient).begin,
        end: (primaryGradient as LinearGradient).end,
      ),
    );
  }
}
