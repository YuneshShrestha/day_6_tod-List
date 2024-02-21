import 'package:flutter/material.dart';
import 'package:todo_list_day6/screen/add_screen.dart';
import 'package:todo_list_day6/screen/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AddScreen.route:
        return MaterialPageRoute(builder: (_) {
          return const AddScreen();
        });

      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) {
          return const HomeScreen();
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route found"),
            ),
          );
        });
    }
  }
}
