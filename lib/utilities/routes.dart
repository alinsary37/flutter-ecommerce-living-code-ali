import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/controllers/database_controller.dart';
import 'package:flutter_ecommerce/models/product.dart';

// import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:flutter_ecommerce/views/pages/bottom_navbar.dart';
import 'package:flutter_ecommerce/views/pages/checkout_page/add_shipping_address_page.dart';
import 'package:flutter_ecommerce/views/pages/landing_page.dart';
import 'package:flutter_ecommerce/views/pages/auth_page.dart';
import 'package:flutter_ecommerce/views/pages/product_detailis.dart';
import 'package:flutter_ecommerce/views/pages/profile_page.dart';
import 'package:provider/provider.dart';

import '../views/pages/checkout_page/checkout_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRouts.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRouts.productDetailsRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
            value: database,
            child: ProductDetails(
              product: product,
            )),
        settings: settings,
      );
    case AppRouts.checkoutPageRoute:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: CheckoutPage(),
        ),
        settings: settings,
      );
    case AppRouts.addShippingAddress:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child:const AddShippingAddressPage(),
        ),
        settings: settings,
      );
    case AppRouts.profilePageRoute:
      return CupertinoPageRoute(
        builder: (_) => const ProfilePage(),
        settings: settings,
      );
    case AppRouts.bottomNavBarPAgeRoute:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavBar(),
        settings: settings,
      );
    case AppRouts.landingPageRote:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
