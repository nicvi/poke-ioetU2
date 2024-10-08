import 'package:flutter/material.dart';
import 'package:poke_u2/widgets/molecules/splash_screen.dart';
import 'package:poke_u2/widgets/pages/pokemon_profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke api',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/poke-detail': (context) => const PokemonProfileView(),
      },
    );
  }
}