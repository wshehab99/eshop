import 'package:eshop/presentation/product/views/category_products_view.dart';
import 'package:eshop/presentation/product/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../presentation/main/views/main_view.dart';
import '../../presentation/splash/splash_view.dart';
import 'route_manager.dart';

//generate route from the name of screen that saved in route_manager
abstract class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return _onGeneratePageTransition(const SplashView());
      case RouteManager.main:
        return _onGeneratePageTransition(const MainView());
      case RouteManager.categoryProducts:
        return _onGeneratePageTransition(CategoryProductsView(
          settings.arguments as String,
        ));
      case RouteManager.productDetails:
        return _onGeneratePageTransition(ProductDetailsView(
          settings.arguments as int,
        ));
      default:
        return _default();
    }
  }

  static Route<dynamic> _default() {
    return _onGeneratePageTransition(
      const Scaffold(
        body: Center(
          child: Text("NoRouteFound"),
        ),
      ),
      type: PageTransitionType.bottomToTop,
    );
  }

  static PageTransition<dynamic> _onGeneratePageTransition(
    Widget child, {
    Alignment? alignment,
    PageTransitionType? type,
  }) {
    return PageTransition(
      child: child,
      type: type ?? PageTransitionType.leftToRight,
      alignment: alignment,
    );
  }
}
