import 'package:adaptix/adaptix.dart';
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/product_grid.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.sizeOf(context).width >= 1024 ? 4 : 2;
    final s = AppLocalizations.of(context)!;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.adaptedPx(context)),
            child: Text(s.yourFavorites, style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
        ProductGridView(),
      ],
    );
  }
}


