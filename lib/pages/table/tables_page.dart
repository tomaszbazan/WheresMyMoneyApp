import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:wheres_my_money/components/tables/InvoiceTable.dart';
import 'package:wheres_my_money/components/tables/TopChannel.dart';
import 'package:wheres_my_money/components/tables/TopProducts.dart';
import 'package:wheres_my_money/pages/layout.dart';
import 'package:wheres_my_money/flutter_gen/app_localizations.dart';

class TablesPage extends LayoutWidget {
  const TablesPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 450, width: double.maxFinite, child: TopChannelWidget()),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(height: 450, width: double.maxFinite,  child:TopProductsWidget()),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(height: 450, width: double.maxFinite,  child:InvoiceTableWidget()),
      ],
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.tables;
  }
}
