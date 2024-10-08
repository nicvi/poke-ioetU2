import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PokemonImageProfile extends StatefulWidget {
  final String pokeName;
  final Object imageRoute;
  const PokemonImageProfile({
    super.key,
    required this.imageRoute,
    required this.pokeName
  });

  @override
  _PokemonImageProfileState createState() => _PokemonImageProfileState();
}

class _PokemonImageProfileState extends State<PokemonImageProfile> {

  Future<void> takePokePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      String picPartialName = path.basename(pickedFile.path).split('-')[0];
      final imagePath = path.join(
          directory.path,
          "${widget.pokeName}-$picPartialName.jpg"
      );
      await File(pickedFile.path).copy(imagePath);
    }
  }

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
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: widget.imageRoute is String
              ? Image.network(
                widget.imageRoute as String,
                fit: BoxFit.contain,
                height: 200,
              )
              : Image.file(
                widget.imageRoute as File,
                fit: BoxFit.cover,
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
              onPressed: () async {
                takePokePhoto();
              },
            ),
          ),
        ],
      ),
    );
  }
}
