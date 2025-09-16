import 'package:adaptix/adaptix.dart';
import 'package:elimde/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class VendorCard extends StatelessWidget {
  const VendorCard({super.key, required this.name, this.description, this.logo, this.banner, this.rating = 4.6, this.products = 120, required this.onTap});

  final String name;
  final String? description;
  final ImageProvider? logo;
  final ImageProvider? banner;
  final double rating;
  final int products;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.colorScheme.surface;
    final outline = theme.colorScheme.outlineVariant;
    final s = AppLocalizations.of(context)!;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: surface,
            border: Border.all(color: outline, width: 0.5.adaptedPx(context)),
            borderRadius: BorderRadius.circular(8.adaptedPx(context))
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.adaptedPx(context),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: banner != null
                        ? DecorationImage(image: banner!, fit: BoxFit.contain)
                        : null,
                    color: banner == null ? theme.dividerTheme.color : null,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.adaptedPx(context)),
                      topRight: Radius.circular(8.adaptedPx(context)),
                    ),
                  ),
                  child: banner == null
                      ? Center(
                    child: Icon(Icons.storefront_outlined, size: 48.adaptedPx(context), color: Colors.white),
                  )
                      : null,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.adaptedPx(context), left: 16.adaptedPx(context), right: 16.adaptedPx(context), bottom: 16.adaptedPx(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: theme.textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                      SizedBox(height: 4.adaptedPx(context)),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                          SizedBox(width: 4.adaptedPx(context)),
                          Text(rating.toStringAsFixed(1)),
                        ],
                      ),
                      SizedBox(height: 4.adaptedPx(context)),
                      if (description != null)
                        Text(description!, style: theme.textTheme.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                      SizedBox(height: 8.adaptedPx(context)),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 70.adaptedPx(context),
              child: Container(
                width: 60.adaptedPx(context),
                height: 60.adaptedPx(context),
                margin: EdgeInsets.only(left: 16.adaptedPx(context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.adaptedPx(context)),
                  border: Border.all(color: outline, width: 2.adaptedPx(context)),
                  image: logo != null
                      ? DecorationImage(image: logo!, fit: BoxFit.cover)
                      : null,
                  color: logo == null ? outline : null,
                ),
                child: logo == null
                    ? Center(
                  child: Icon(Icons.person_outline, size: 32.adaptedPx(context), color: Colors.white),
                )
                    : null,
              )
            )
          ],
        ),
      ),
    );
  }
}


