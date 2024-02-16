import 'package:flutter/material.dart';
import 'package:tempt/consts/theme_consts.dart';
import 'package:tempt/utils/route_generator.dart';

/// Main function.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Generate routes to manage all the navigation with named parameters.
      onGenerateRoute: RouteGenerator.generate,
      // Theme consts
      theme: ThemeC.lightTheme,
      // Setup as initial routes
      initialRoute: ConstRoutes.setup,
    );
  }
}
