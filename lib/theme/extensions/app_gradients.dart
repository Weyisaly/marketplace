import 'package:flutter/material.dart';

class AppGradients extends ThemeExtension<AppGradients> {
  const AppGradients({required this.primaryGradient});

  final Gradient primaryGradient;

  static AppGradients light(ColorScheme scheme) => AppGradients(
    primaryGradient: const LinearGradient(
      colors: [
        Color(0xff3B82F6),
        Color(0xff9333EA),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 0.5],
    ),
  );

  static AppGradients dark(ColorScheme scheme) => AppGradients(
    primaryGradient: const LinearGradient(
      colors: [
        Color(0xff3B82F6),
        Color(0xff9333EA),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 0.5],
    ),
  );

  @override
  AppGradients copyWith({Gradient? primaryGradient}) {
    return AppGradients(primaryGradient: primaryGradient ?? this.primaryGradient);
  }

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this;
    return AppGradients(
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
