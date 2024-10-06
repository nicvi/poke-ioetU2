import 'package:flutter/material.dart';

import '../../services/pokemon.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});
  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Row(
        children: <Widget>[
          Image.network(
            widget.pokemon.pic ?? "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.pokemon.name,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                Text(
                  widget.pokemon.element?.join(" ") ?? "",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
