import 'package:flutter/material.dart';
import 'package:poke_u2/splash_screen.dart';
import 'package:poke_u2/widgets/organisms/PokemonListView.dart';

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
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          // Additional Widget at the top
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to your Pokemon!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: PokemonListView()), // Add the ItemListScreen here
        ],
      ),
    );
  }
}
