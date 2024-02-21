import 'package:flutter/material.dart';
import 'package:todo_list_day6/routes/route_generator.dart';
import 'package:todo_list_day6/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.route,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
