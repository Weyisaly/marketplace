import 'package:adaptix/adaptix.dart';
import 'package:flutter/material.dart';
import '../../widgets/vendor_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/vendor_list.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.adaptedPx(context)),
      child: VendorsList(),
    );
  }
}


