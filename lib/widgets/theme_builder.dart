import 'package:flutter/material.dart';

class ThemeBuilder extends StatefulWidget {
  const ThemeBuilder({super.key, required this.builder});
  final Widget Function(BuildContext context, Brightness brightness) builder;

  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();

 static of(BuildContext context) {
    return context.findAncestorStateOfType<_ThemeBuilderState>()!;
  }
 
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  late Brightness brightness;
  @override
  void initState() {
    brightness = Brightness.dark;
    super.initState();
  }

  void changeTheme() {
    setState(() {
      brightness =
          brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, brightness);
  }
}
