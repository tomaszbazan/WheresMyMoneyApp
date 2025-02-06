import 'package:wheres_my_money/deferred_widget.dart';
import 'package:wheres_my_money/pages/modal/modal_page.dart' deferred as modal;
import 'package:wheres_my_money/pages/table/contacts_page.dart' deferred as contacts;
import 'package:wheres_my_money/pages/toast/toast_page.dart' deferred as toast;
import 'package:wheres_my_money/pages/tools/tools_page.dart' deferred as tools;
import 'package:flutter/material.dart';
import 'package:wheres_my_money/pages/alerts/alert_page.dart' deferred as alert;
import 'package:wheres_my_money/pages/button/button_page.dart' deferred as button;
import 'package:wheres_my_money/pages/form/form_elements_page.dart' deferred as formElements;
import 'package:wheres_my_money/pages/form/form_layout_page.dart' deferred as formLayout;
import 'package:wheres_my_money/pages/auth/sign_in/sign_in_page.dart' deferred as signIn;
import 'package:wheres_my_money/pages/auth/sign_up/sign_up_page.dart' deferred as signUp;
import 'package:wheres_my_money/pages/calendar/calendar_page.dart' deferred as calendar;
import 'package:wheres_my_money/pages/chart/chart_page.dart' deferred as chart;
import 'package:wheres_my_money/pages/dashboard/ecommerce_page.dart';
import 'package:wheres_my_money/pages/inbox/index.dart' deferred as inbox;
import 'package:wheres_my_money/pages/invoice/invoice_page.dart' deferred as invoice;
import 'package:wheres_my_money/pages/profile/profile_page.dart' deferred as profile;
import 'package:wheres_my_money/pages/resetpwd/reset_pwd_page.dart' deferred as resetPwd;
import 'package:wheres_my_money/pages/setting/settings_page.dart' deferred as settings;
import 'package:wheres_my_money/pages/table/tables_page.dart' deferred as tables;

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

final List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/', 'widget': const EcommercePage()},
  {'routerPath': '/calendar', 'widget': DeferredWidget(calendar.loadLibrary, () => calendar.CalendarPage())},
  {'routerPath': '/profile', 'widget': DeferredWidget(profile.loadLibrary, () => profile.ProfilePage())},
  {
    'routerPath': '/formElements',
    'widget': DeferredWidget(formElements.loadLibrary, () => formElements.FormElementsPage()),
  },
  {'routerPath': '/formLayout', 'widget': DeferredWidget(formLayout.loadLibrary, () => formLayout.FormLayoutPage())},
  {'routerPath': '/signIn', 'widget': DeferredWidget(signIn.loadLibrary, () => signIn.SignInWidget())},
  {'routerPath': '/signUp', 'widget': DeferredWidget(signUp.loadLibrary, () => signUp.SignUpWidget())},
  {
    'routerPath': '/resetPwd',
    'widget': DeferredWidget(resetPwd.loadLibrary, () => resetPwd.ResetPwdWidget()),
  },
  {'routerPath': '/invoice', 'widget': DeferredWidget(invoice.loadLibrary, () => invoice.InvoicePage())},
  {'routerPath': '/inbox', 'widget': DeferredWidget(inbox.loadLibrary, () => inbox.InboxWidget())},
  {'routerPath': '/tables', 'widget': DeferredWidget(tables.loadLibrary, () => tables.TablesPage())},
  {'routerPath': '/settings', 'widget': DeferredWidget(settings.loadLibrary, () => settings.SettingsPage())},
  {'routerPath': '/basicChart', 'widget': DeferredWidget(chart.loadLibrary, () => chart.ChartPage())},
  {'routerPath': '/buttons', 'widget': DeferredWidget(button.loadLibrary, () => button.ButtonPage())},
  {'routerPath': '/alerts', 'widget': DeferredWidget(alert.loadLibrary, () => alert.AlertPage())},
  {'routerPath': '/contacts', 'widget': DeferredWidget(contacts.loadLibrary, () => contacts.ContactsPage())},
  {'routerPath': '/tools', 'widget': DeferredWidget(tools.loadLibrary, () => tools.ToolsPage())},
  {'routerPath': '/toast', 'widget': DeferredWidget(toast.loadLibrary, () => toast.ToastPage())},
  {
    'routerPath': '/modal',
    'widget': DeferredWidget(modal.loadLibrary, () => modal.ModalPage())
  },
];

class RouteConfiguration {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Rex');

  static BuildContext? get navigatorContext =>
      navigatorKey.currentState?.context;

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    String path = settings.name!;

    dynamic map =
        MAIN_PAGES.firstWhere((element) => element['routerPath'] == path);

    if (map == null) {
      return null;
    }
    Widget targetPage = map['widget'];

    builder(context, match) {
      return targetPage;
    }

    return NoAnimationMaterialPageRoute<void>(
      builder: (context) => builder(context, null),
      settings: settings,
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
