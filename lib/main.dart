import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/views/home_views.dart';

void main() {
  runApp(const MyApp());
}

bool isTrue = true;
bool isFalse = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: isFalse,
      home: const HomeViews(),
      title: 'Sample App',
      theme: ThemeData(
          useMaterial3: isTrue,
          textTheme: GoogleFonts.barlowTextTheme(),
          appBarTheme: const AppBarTheme(
              elevation: 0.0,
              scrolledUnderElevation: 0.0,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black))),
    );
  }
}
