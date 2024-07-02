import 'package:flutter/material.dart';

final navigate = NavigationHelper();

class NavigationHelper {
  /// Global key to use in navigator
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// Navigating to some screen using [routeName] and optional
  /// argument [data]
  Future<dynamic> pushTo(String routeName, {dynamic data}) =>
      _navigatorKey.currentState!.pushNamed(routeName, arguments: data);

  Future<dynamic> pushToReplacement(String routeName, {dynamic data}) =>
      _navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: data);

  /// Navigating to some screen using [routeName] and optional
  /// argument [data], this function include clear all navigation stack
  Future<dynamic> pushToRemoveUntil(String routeName, {dynamic data}) =>
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: data);

  /// Navigating back using pop,
  /// with optional argument [data]
  dynamic pop({dynamic data}) => _navigatorKey.currentState!.pop(data);
}
