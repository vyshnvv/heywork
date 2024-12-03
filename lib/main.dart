import 'package:flutter/material.dart';
import 'package:heywork/screens/landing_screen.dart';
import 'package:heywork/screens/sign_in_screen.dart';
import 'package:heywork/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeyWork',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ).copyWith(
          scaffoldBackgroundColor: secondary10,
          textTheme: TextTheme(
              bodySmall: TextStyle(color: secondary20),
              bodyMedium: TextStyle(color: secondary20),
              bodyLarge: TextStyle(color: secondary20))),
      routes: {
        LandingScreen.routeName: (context) => const LandingScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
      },
      initialRoute: SignInScreen.routeName,
    );
  }
}
