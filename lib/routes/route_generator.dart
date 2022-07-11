import 'package:flutter/material.dart';
import 'package:foukabay_admin/Screens/landing_page.dart';
import 'package:foukabay_admin/Screens/workshops_page.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case Routes.events:
        return MaterialPageRoute(builder: (_) => WorkShops());
      // case Routes.description:
      //   return MaterialPageRoute(builder: (_) => const DescriptionPage(args));
      // case Routes.main:
      //   return MaterialPageRoute(builder: (_) => const MainPage());
      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => const HomePage());
      // case Routes.changePassword:
      //   return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      // case Routes.description:
      //   if (args is Events) {
      //     return MaterialPageRoute(builder: (_) => DescriptionPage(args));
      //   } else {
      //     return _errorRoute();
      //   }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
