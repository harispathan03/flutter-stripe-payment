import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stipe_demo/src/ui/bank_account/bank_account_page.dart';
import 'package:stipe_demo/src/ui/card_payment/card_payment_page.dart';
import 'package:stipe_demo/src/ui/home/home_page.dart';
import 'package:stipe_demo/src/view_models/bank_account_view_model.dart';

import '../../view_models/card_payment_view_model.dart';
import '../constants/route_names.dart';
import '../page_transition/page_transition.dart';
import '../page_transition/page_transition_type.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        switch (settings.name) {
          case RouteNames.initialRoute:
            return const HomePage();
          case RouteNames.cardPayment:
            return ChangeNotifierProvider(
              create: (_) => CardPaymentViewModel(),
              child: const CardPaymentPage(),
            );
          case RouteNames.bankAccount:
            return ChangeNotifierProvider(
              create: (_) => BankAccountViewModel(),
              child: const BankAccountPage(),
            );
          default:
            return _errorRoute(settings);
        }
      },
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return getEffect(PageTransitionType.slideInLeft)(
            Curves.linear, animation, secondaryAnimation, child);
      },
    );
  }

  static _errorRoute(RouteSettings settings) {
    return Center(
      child: Text("${RouteNames.noRouteFound}: ${settings.name}"),
    );
  }
}
