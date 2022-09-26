import 'package:flutter/material.dart';
import 'package:kitty/pages/main_pages/home_page.dart';

enum NavigationStateStatus {
  initial,
  menu,
  tab,
}

@immutable
class NavigationState {
  const NavigationState({
    this.status = NavigationStateStatus.initial,
    this.currentIndex = 0,
    this.route = HomePage.routeName,
  });

  final NavigationStateStatus status;
  final int currentIndex;
  final String route;

  NavigationState copyWith({
    NavigationStateStatus? status,
    int? currentIndex,
    String? route,
  }) {
    return NavigationState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
      route: route ?? this.route,
    );
  }
}
