import 'package:wheres_my_money/pages/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wheres_my_money/flutter_gen/app_localizations.dart';

class AdvanceTablePage extends LayoutWidget {
  const AdvanceTablePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.advanceTable;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
