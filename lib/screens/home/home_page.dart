import 'package:adaptix/adaptix.dart';
import 'package:elimde/screens/vendors/vendors_page.dart';
import 'package:elimde/widgets/gradient_button.dart';
import 'package:elimde/widgets/slider.dart';
import 'package:flutter/material.dart';
import '../../widgets/gradient_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/product_grid.dart';
import '../../widgets/vendor_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppLocalizations.of(context)!;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: GradientContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.adaptedPx(context), vertical: 30.adaptedPx(context)),
              child: Column(
                children: [
                  Text(s.homeTitle, textAlign: TextAlign.center, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700,),),
                  SizedBox(height: 15.adaptedPx(context),),
                  Text(s.homeSubtitle, textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700,),),
                  SizedBox(height: 15.adaptedPx(context),),
                  SizedBox(width: double.infinity, child: GradientButton(onPressed: (){}, child: Text(s.becomeVendor) )),
                  SizedBox(height: 15.adaptedPx(context),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shield_outlined, color: Color(0xff3B82F6),),
                      SizedBox(width: 8.adaptedPx(context),),
                      Text(s.verifiedVendors)
                    ],
                  ),
                  SizedBox(height: 15.adaptedPx(context),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_shipping_outlined, color: Color(0xff3B82F6),),
                      SizedBox(width: 8.adaptedPx(context),),
                      Text(s.fastDelivery)
                    ],
                  ),
                  SizedBox(height: 15.adaptedPx(context),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.workspace_premium, color: Color(0xff3B82F6),),
                      SizedBox(width: 8.adaptedPx(context),),
                      Text(s.premiumQuality)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ModernCarousel(),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.adaptedPx(context), vertical: 20.adaptedPx(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(s.featuredVendors, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700,),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VendorsPage()));
                      },
                      child: Text(s.seeAll, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600,),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: VendorsList()),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.adaptedPx(context), vertical: 20.adaptedPx(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(s.discoverProducts, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700,),),
                    TextButton(
                      onPressed: () {},
                      child: Text(s.seeAll, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600,),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: ProductGridView()),
    ],
          );
  }
}





