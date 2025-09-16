import 'package:adaptix/adaptix.dart';
import 'package:elimde/screens/vendors/vendor_details/vendor_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'vendor_card.dart';

class VendorsList extends StatelessWidget {
  const VendorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.sizeOf(context).width >= 1024
        ? 4
        : MediaQuery.sizeOf(context).width >= 600
        ? 3
        : 2;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.adaptedPx(context),
        vertical: 8.adaptedPx(context),
      ),
      child: MasonryGridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8.adaptedPx(context),
        crossAxisSpacing: 8.adaptedPx(context),
        itemCount: 4,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final vendor = _sampleVendors[index % _sampleVendors.length];
          return VendorCard(
            name: vendor.name,
            description: vendor.description,
            products: vendor.products,
            rating: vendor.rating, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> VendorDetailsPage()));
          },
          );
        },
      ),
    );
  }
}

class SampleVendor {
  const SampleVendor({
    required this.name,
    this.description,
    required this.products,
    required this.rating,
  });

  final String name;
  final String? description;
  final int products;
  final double rating;
}

const List<SampleVendor> _sampleVendors = [
  SampleVendor(
    name: 'Barista Hub',
    description: 'Your neighborhood specialty coffee shop',
    products: 240,
    rating: 4.7,
  ),
  SampleVendor(
    name: 'Roast & Co.',
    description: 'Single-origin roasts and blends',
    products: 180,
    rating: 4.6,
  ),
  SampleVendor(
    name: 'Cafe Delight',
    description: 'Brewing accessories and more',
    products: 120,
    rating: 4.5,
  ),
];