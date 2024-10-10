import 'package:flutter/material.dart';
import '../../models/stats.dart';
import '../molecules/weight_view.dart';
import '../organisms/pokemon_image_carousel.dart';
import '../organisms/stat_list_view.dart';

class PokeDetails extends StatelessWidget {
  final String pokemonName;
  final double pokemonWeight;
  final String pokePicUrl;
  final Stats stats;

  const PokeDetails({
    super.key,
    required this.pokemonName,
    required this.pokemonWeight,
    required this.pokePicUrl,
    required this.stats,
  });

  String capitalize(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Details"),
      ),
      body: Column(
        children: [
          PokemonImageCarousel(
              pokemonPicUrl: pokePicUrl,
              pokemonName: pokemonName
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              capitalize(pokemonName),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          WeightView(weight: pokemonWeight,),
          const SizedBox(height: 5),
          StatListView(stats : stats),
        ],
      ),
    );
  }
}
