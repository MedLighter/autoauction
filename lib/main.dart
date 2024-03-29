import 'package:autoauction/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarAuction',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        // textTheme: TextTheme(
        //   displayLarge: const TextStyle(
        //       fontSize: 72, fontWeight: FontWeight.normal, color: Colors.black),
        //   titleLarge: GoogleFonts.oswald(
        //       fontSize: 30, fontStyle: FontStyle.italic, color: Colors.black),
        //   bodyMedium: GoogleFonts.merriweather(color: Colors.black),
        //   displaySmall: GoogleFonts.pacifico(color: Colors.black),
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      // home: const NavigationScreen(),
    );
  }
}
