import 'package:adaptix/adaptix.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../screens/home/home_page.dart';
import 'product_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
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
      padding: EdgeInsets.symmetric(horizontal: 8.adaptedPx(context), vertical: 8.adaptedPx(context)),
      child: MasonryGridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 5.adaptedPx(context),
        crossAxisSpacing: 5.adaptedPx(context),
        itemCount: 12,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final product = SampleProducts[index % SampleProducts.length];
          return ProductCard(
            title: product.title,
            description: product.description,
            price: product.price,
            oldPrice: product.oldPrice,
          );
        },
      ),
    );
  }
}

class SampleProduct {
  const SampleProduct({required this.title, this.description, required this.price, this.oldPrice});

  final String title;
  final String? description;
  final String price;
  final String? oldPrice;
}

const List<SampleProduct> SampleProducts = [
  SampleProduct(title: 'Arabica Coffee Beans 1kg', description: 'Freshly roasted premium beans', price: '124.99', oldPrice: '149.99'),
  SampleProduct(title: 'Espresso Roast 500g', description: 'Rich and bold flavor', price: '79.99'),
  SampleProduct(title: 'French Press', description: 'Borosilicate glass 600ml', price: '39.99', oldPrice: '49.99'),
  SampleProduct(title: 'Milk Frother', description: 'Handheld, stainless steel', price: '19.99'),
];
