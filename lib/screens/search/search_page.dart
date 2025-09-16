import 'package:adaptix/adaptix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/product_grid.dart';
import '../../widgets/text_field.dart';
import '../../widgets/vendor_list.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  final TextEditingController productsController = TextEditingController();
  final TextEditingController vendorsController = TextEditingController();
  String productsSearchQuery = '';
  String vendorsSearchQuery = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    productsController.dispose();
    vendorsController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onProductsSearchChanged(String query) {
    setState(() {
      productsSearchQuery = query.trim();
    });
  }

  void _onVendorsSearchChanged(String query) {
    setState(() {
      vendorsSearchQuery = query.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    return Scaffold(
        appBar: AppBar(
          title: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2.0,
                ),
              ),
            ),
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            tabs: [
              Tab(text: strings.searchProducts),
              Tab(text: strings.searchVendors),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.adaptedPx(context),
                    vertical: 16.adaptedPx(context),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: CustomTextField(
                        controller: productsController,
                        hintText: strings.searchProducts,
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
                      ),),
                      SizedBox(width: 10.adaptedPx(context)),
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: theme.inputDecorationTheme.fillColor,
                          border: Border.all(
                            color: theme.inputDecorationTheme.enabledBorder!.borderSide.color
                          ),
                          borderRadius: BorderRadius.circular(12.adaptedPx(context)),
                        ),
                        child: Icon(Icons.filter_alt_outlined, color: theme.inputDecorationTheme.prefixIconColor,),
                      )
                    ]
                  ),
                ),
                const Expanded(child: ProductGridView())
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.adaptedPx(context),
                    vertical: 16.adaptedPx(context),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: vendorsController,
                          hintText: strings.searchVendors,
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: vendorsSearchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    vendorsController.clear();
                                    _onVendorsSearchChanged('');
                                  },
                                )
                              : null,
                          onChanged: _onVendorsSearchChanged,
                        )
                      ),
                    ],
                  ),
                ),
                const Expanded(child: VendorsList())
              ],
            )
          ],
        ),
      );
  }
}