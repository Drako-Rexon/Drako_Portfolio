import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_drako/config/app_route.dart';
import 'package:portfolio_drako/utils/colors.dart';
import 'package:portfolio_drako/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool? theme;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  Future<void> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      theme = pref.getBool('theme') ?? false;
    });
  }

  changeTheme() async {
    // final pref = await SharedPreferences.getInstance();
    // bool? theme = pref.getBool("theme");
    // if (theme == null || theme == false) {
    //   pref.setBool("theme", true);
    //   setState(() {});
    // }
    setState(() {
      theme = !theme!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        primaryColor: primaryTextColor,
        secondaryHeaderColor: secondaryTextColor,
        backgroundColor: primaryBackgroundColor,
        fontFamily: GoogleFonts.openSans().fontFamily,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: primaryTextColor,
        primaryColor: lightTextColor,
        secondaryHeaderColor: lightTextColor,
        backgroundColor: Colors.white,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      routes: {AppRoute.HOME: (_) => const HomePage()},
    );
  }
}
