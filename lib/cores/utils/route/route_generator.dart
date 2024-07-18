import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';
import 'package:flutterboilerplate/features/onboarding/presentation/pages/onboarding_page.dart';

class RouteGenerator {
  RouteGenerator._();

  /// Initializing route
  static Route<dynamic>? generate(RouteSettings settings) {
    /// Declaring argument route
    final arguments = settings.arguments;

    switch (settings.name) {
      case RouteName.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
          settings: const RouteSettings(
            name: RouteName.onBoarding,
          ),
        );
    }

    return null;
  }
}
