import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/controller/networking.dart';
import 'package:pokedex/view/homeScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiURL = 'https://pokeapi.co/api/v2/pokemon/?limits=250';

  // Future<void> getData()async{
  //
  //   // NetworkHelper networkHelper = NetworkHelper(url: Uri.parse(apiURL));
  //   // String? pokemonData = await networkHelper.fetchPokemon() ;
  //   // print('pokemondata = $pokemonData');
  //
  //   if(pokemonData != null) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder:(context) {
  //           return HomeScreen();
  //         },),
  //       );
  //   }
  // }

  Future<void> getData() async {
    PokeAPI.getPokemon().then((response) {
      List<Map<String, dynamic>> data =
          List.from(jsonDecode(response.body)['results']);

      if (data != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitWave(
        color: Colors.redAccent,
        size: 50,
      ),
    );
  }
}
