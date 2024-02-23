import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_day6/routes/route_generator.dart';
import 'package:todo_list_day6/screen/home.dart';
import 'package:todo_list_day6/widgets/theme_builder.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, brightness) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: brightness,
            ),
            textTheme: const TextTheme(
              displayLarge: TextStyle(fontSize: 20),
            ),
            useMaterial3: true,
            // brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.route,
          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        );
      },
    );
  }
}
