import 'package:flutter/material.dart';
import 'package:expense_app/main_controller.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 19, 123, 126),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 2, 0, 0),
);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainController(),
      darkTheme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 14, 35, 36),
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(255, 6, 22, 23),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        ),
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          shadowColor: const Color.fromARGB(255, 18, 68, 70),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 7, 28, 30),
          foregroundColor: const Color.fromARGB(255, 167, 170, 170),
        ),
      ),
      theme: ThemeData().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 224, 246, 247),
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(255, 224, 246, 247),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        ),
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          shadowColor: const Color.fromARGB(255, 220, 247, 248),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 2, 131, 138),
          foregroundColor: const Color.fromARGB(255, 210, 251, 253),
        ),
      ),
    );
  }
}
