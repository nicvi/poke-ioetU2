import 'package:flutter/material.dart';


class PokemonImageProfile extends StatelessWidget {
  final String imageUrl;

  const PokemonImageProfile({super.key,required this.imageUrl});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                height: 200,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.camera),
              iconSize: 40,
              onPressed: () {
                // Add your icon button functionality here
              },
            ),
          ),
        ],
      ),
    );
  }
}
