import 'package:adaptix/adaptix.dart';
import 'package:flutter/material.dart';
import '../theme/extensions/app_gradients.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.title, this.description, required this.price, this.oldPrice, this.image});

  final String title;
  final String? description;
  final String price;
  final String? oldPrice;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradients = theme.extension<AppGradients>()!;
    final isDark = theme.brightness == Brightness.dark;
    final surface = theme.colorScheme.surface;
    final outline = theme.colorScheme.outlineVariant;
    return Container(
      decoration: BoxDecoration(
        color: surface,
        border: Border.all(color: outline, width: 0.5.adaptedPx(context)),
        borderRadius: BorderRadius.circular(8.adaptedPx(context))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.adaptedPx(context), right: 5.adaptedPx(context), top: 5.adaptedPx(context)),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.adaptedPx(context)),
                topRight: Radius.circular(8.adaptedPx(context)),
              ),
              child: Container(
                height: 160.adaptedPx(context),
                decoration: BoxDecoration(
                  image: image != null
                      ? DecorationImage(image: image!, fit: BoxFit.cover)
                      : null,
                  gradient: image == null ? gradients.primaryGradient as LinearGradient? : null,
                ),
                child: image == null
                    ? Center(
                  child: Icon(Icons.image_outlined, size: 48.adaptedPx(context), color: Colors.white),
                )
                    : null,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.adaptedPx(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                SizedBox(height: 6.adaptedPx(context)),
                if (description != null)
                  Text(description!, style: theme.textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                if (description != null) SizedBox(height: 6.adaptedPx(context)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("$price m.", style: theme.textTheme.titleMedium),
                    if (oldPrice != null) ...[
                      SizedBox(width: 6.adaptedPx(context)),
                      Text("${oldPrice} m.", style: theme.textTheme.labelSmall?.copyWith(decoration: TextDecoration.lineThrough)),
                    ],
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


