import 'package:flutter/material.dart';
import '../theme/extensions/container_gradient.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradients = theme.extension<ContainerGradients>()!;

    return Container(
      decoration: BoxDecoration(
        gradient: gradients.primaryGradient,
      ),
      child: child,
    );
  }
}
