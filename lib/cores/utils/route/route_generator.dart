import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  /// Initializing route
  static Route<dynamic>? generate(RouteSettings settings) {
    /// Declaring argument route
    // final arguments = settings.arguments;

    // switch (settings.name) {
    //   case RouteName.onBoarding:
    //     return MaterialPageRoute(
    //       builder: (_) => const OnBoardingPage(),
    //       settings: const RouteSettings(
    //         name: RouteName.onBoarding,
    //       ),
    //     );
    //   case RouteName.createCertificationScheme:
    //     if (arguments is SchemaEntity) {
    //       return MaterialPageRoute(
    //         builder: (_) => CreateCertificationSchemePage(schema: arguments),
    //         settings: const RouteSettings(
    //           name: RouteName.createCertificationScheme,
    //         ),
    //       );
    //     }
    // }

    return null;
  }
}
