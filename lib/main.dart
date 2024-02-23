import 'package:flutter/material.dart';
import 'package:todo_list_day6/routes/route_generator.dart';
import 'package:todo_list_day6/screen/home.dart';
import 'package:todo_list_day6/widgets/themeBuilder.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
        enabled: false,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (_) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(builder: (context, brightness) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: brightness,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 40),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.route,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      );
    });
  }
}
