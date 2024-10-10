import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../molecules/pokemon_image_profile.dart';

class PokemonImageCarousel extends StatefulWidget {
  final String pokemonName;
  final String pokemonPicUrl;

  const PokemonImageCarousel({
    super.key,
    required this.pokemonPicUrl,
    required this.pokemonName,
  });

  @override
  _PokemonImageCarouselState createState() => _PokemonImageCarouselState();
}

class _PokemonImageCarouselState extends State<PokemonImageCarousel> {
  List<File>  pokemonPhotos = [];

  @override
  void initState() {
    super.initState();
    findPokemonPics(widget.pokemonName);
  }

  Future<void> findPokemonPics(String partialName) async {
    final appDirectory = await getApplicationDocumentsDirectory();

    final List<FileSystemEntity> files = appDirectory.listSync();

    List<File> matchedFiles = [];
    for (var file in files) {
      if (file is File) {
        String fileName = path.basename(file.path);
        if (fileName.contains(partialName) && fileName.endsWith('.jpg')) {
          matchedFiles.add(file);
        }
      }
    }

    setState(() {
      pokemonPhotos=matchedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: false,
      ),
      items: [
        PokemonImageProfile(
          imageRoute: widget.pokemonPicUrl,
          pokeName: widget.pokemonName,
        ),

        ...pokemonPhotos.map(
                (pokemonPhoto) => pokemonImageProfilesFromFile(pokemonPhoto)
        ),
      ],
    );
  }

  Widget pokemonImageProfilesFromFile(File pokemonPhotoDir) {
    return PokemonImageProfile(
        imageRoute: pokemonPhotoDir,
        pokeName: widget.pokemonName,
    );
  }
}
