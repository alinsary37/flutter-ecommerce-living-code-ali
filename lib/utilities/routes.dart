import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:flutter_ecommerce/views/pages/landing_page.dart';
import 'package:flutter_ecommerce/views/pages/auth_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRouts.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
    case AppRouts.landingPageRote:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
