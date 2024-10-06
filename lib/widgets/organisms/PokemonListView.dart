import 'package:flutter/material.dart';

import '../../services/pokemon.dart';
import '../../services/pokemon_services.dart';
import '../molecules/pokemonCard.dart';


class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  List<Pokemon> pokemonToDisplay = [];
  String nextPokemonRequestUrl = "";
  Map<String, dynamic> displayedPokemon = {};

    
  @override
  void initState() {
    super.initState();
    displayPokemon();
  }

  Future<void> displayPokemon() async {
    List<dynamic> fetchedPokemonBunch =  await fetchPokemon("");
    setPokemonFiltered(fetchedPokemonBunch);
  }
  
  Future<List<dynamic>> fetchPokemon(pokemonRequestUrl) async {
    var paginatedFetchedPokemon = await getPokemonPack(
        0,
        20,
        pokemonRequestUrl
    );
    setState(() {
      nextPokemonRequestUrl = paginatedFetchedPokemon["nextIterationUrl"];
    });
    return paginatedFetchedPokemon["iterationResults"];
  }

  void setPokemonFiltered(List<dynamic> fetchedPokemonBunch) async {
    List<Future<Pokemon>> fetchPokemon = fetchedPokemonBunch.map((basicPokemonData) async {

      Map<String, dynamic> rawPokemonData = await getSinglePokemon(basicPokemonData['url']!);
      Pokemon pokemon = createPokemon(rawPokemonData, basicPokemonData['url']!);
      return pokemon;
    }).toList();

    List<Pokemon> fetchedPokemon = await Future.wait(fetchPokemon);

    setState(() {
      pokemonToDisplay = [...pokemonToDisplay,...fetchedPokemon ];
    });
  }

  Pokemon createPokemon(pokemonRawData, pokemonUrl){
    List<String> elementTypes = pokemonRawData["types"]!.map((typeContainer) {
      return typeContainer["type"]!["name"]!;
    }).toList().cast<String>();
    Pokemon pokemon = Pokemon(
      name: pokemonRawData['name']!,
      url: pokemonUrl,
      element: elementTypes,
      pic: pokemonRawData['sprites']['front_default'],
    );
    return pokemon;
  }

  Future<void> _addPokemon() async {
    List<dynamic> newPokemonBunch =  await fetchPokemon(nextPokemonRequestUrl);
    setPokemonFiltered(newPokemonBunch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: ListView.builder(
        itemCount: pokemonToDisplay.length,
        itemBuilder: (context, index) {
          return PokemonCard(pokemon: pokemonToDisplay[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPokemon,
        tooltip: 'Add pokemon',
        child: const Icon(Icons.add),
      ),
    );
  }
}