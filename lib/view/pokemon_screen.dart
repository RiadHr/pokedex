import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonScreen extends StatelessWidget {
  final String pokemonName;
  final String pokemonImg;
  // final double pokemonWeight;

  PokemonScreen({required this.pokemonName, required this.pokemonImg, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 80,
            color: Colors.redAccent,
            child: const Text(
              'Pokedex',
              style: TextStyle(
                  fontFamily: 'PressStart2P',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            pokemonName,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'PressStart2P'),
          ),
          Image.network(pokemonImg),
          // Text(
          //   '$pokemonWeight',
          //   style: const TextStyle(
          //       fontSize: 30,
          //       fontWeight: FontWeight.bold,
          //       fontFamily: 'PressStart2P'),
          // ),
        ],
      ),
    );
  }
}
