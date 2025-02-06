import 'package:flutter/material.dart';

import 'package:wheres_my_money/pages/dashboard/analytics_widget.dart';
import 'package:wheres_my_money/pages/dashboard/channel_widget.dart';
import 'package:wheres_my_money/pages/dashboard/grid_card.dart';
import 'package:wheres_my_money/pages/dashboard/revenue_widget.dart';
import 'package:wheres_my_money/pages/layout.dart';

class EcommercePage extends LayoutWidget {
  const EcommercePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Ecommerce';
  }
  @override
  Widget contentDesktopWidget(BuildContext context) {
    return const Column(children: [
      GridCard(),
      SizedBox(
        height: 16,
      ),
      RevenueWidget(),
      SizedBox(
        height: 16,
      ),
      AnalyticsWidget(),
      SizedBox(
        height: 16,
      ),
      ChannelWidget()
    ]);
  }

}
