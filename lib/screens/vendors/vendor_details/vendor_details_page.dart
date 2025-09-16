import 'package:adaptix/adaptix.dart';
import 'package:elimde/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/text_field.dart';

class VendorDetailsPage extends StatefulWidget {
  const VendorDetailsPage({super.key});

  @override
  State<VendorDetailsPage> createState() => _VendorDetailsPageState();
}

class _VendorDetailsPageState extends State<VendorDetailsPage> {
  final TextEditingController productsController = TextEditingController();
  String productsSearchQuery = '';

  @override
  void dispose() {
    productsController.dispose();
    super.dispose();
  }

  void _onProductsSearchChanged(String query) {
    setState(() {
      productsSearchQuery = query.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(s.vendorDetails),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/vendor_background.png", height: 240.adaptedPx(context), width: double.infinity, fit: BoxFit.cover),
            Transform.translate(
              offset: Offset(0, -60.adaptedPx(context)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.adaptedPx(context)),
                  child: Container(
                    height: 124.adaptedPx(context),
                    width: 124.adaptedPx(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.adaptedPx(context)),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.adaptedPx(context)),
                      child: Image.asset(
                        "assets/images/vendor_logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -30.adaptedPx(context)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.adaptedPx(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Luxe Fashion House", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),),
                    SizedBox(height: 8.adaptedPx(context),),
                    Container(
                      width: 150.adaptedPx(context),
                      padding: EdgeInsets.symmetric(horizontal: 8.adaptedPx(context), vertical: 4.adaptedPx(context)),
                      decoration: BoxDecoration(
                        color: Color(0xff14532D).withOpacity(0.3),
                        border: Border.all(color: Color(0xff15803D), width: 1.adaptedPx(context)),
                        borderRadius: BorderRadius.circular(20.adaptedPx(context)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified_outlined, color: Color(0xff86EFAC), size: 16.adaptedPx(context),),
                          SizedBox(width: 5.adaptedPx(context),),
                          Expanded(child: Text(s.verifiedVendor, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff86EFAC)), maxLines: 2, overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.adaptedPx(context),),
                    Text("Your one-stop shop for premium fashion and accessories.", style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 15.adaptedPx(context),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined, size: 16.adaptedPx(context),),
                        SizedBox(width: 5.adaptedPx(context),),
                        Expanded(child: Text(s.verifiedVendor, style: Theme.of(context).textTheme.bodySmall)),
                      ],
                    ),
                    SizedBox(height: 15.adaptedPx(context),),
                    CustomTextField(
                      controller: productsController,
                      hintText: s.searchProducts,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: productsSearchQuery.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          productsController.clear();
                          _onProductsSearchChanged('');
                        },
                      )
                          : null,
                      onChanged: _onProductsSearchChanged,
                    ),
                  ],
                ),
              ),
            ),
            ProductGridView()
          ],
        ),
      ),
    );
  }
}
