import 'package:flutter/material.dart';
import '../theme/extensions/app_gradients.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.onPressed, required this.child});

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradients = theme.extension<AppGradients>()!;
    final shape = theme.elevatedButtonTheme.style?.shape?.resolve({}) as OutlinedBorder? ??
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
    final padding = theme.elevatedButtonTheme.style?.padding?.resolve({}) ??
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    final textStyle = theme.elevatedButtonTheme.style?.textStyle?.resolve({}) ??
        theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600);

    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: shape,
        gradient: gradients.primaryGradient,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: shape,
          padding: padding,
          textStyle: textStyle,
        ),
        child: child,
      ),
    );
  }
}


