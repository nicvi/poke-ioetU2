import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../template/poke_details.dart';

class PokemonProfileView extends StatelessWidget {
  const PokemonProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemon selectedPokemon =
      ModalRoute.of(context)!.settings.arguments as Pokemon;

    return PokeDetails(
      pokemonName: selectedPokemon.name,
      pokemonWeight: 1,
      pokePicUrl: selectedPokemon.picUrl,
      stats: selectedPokemon.stats,
    );
  }
}
