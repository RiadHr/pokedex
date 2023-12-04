import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:pokedex/controller/networking.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/view/pokemon_screen.dart';

class HomeScreen extends StatefulWidget {
  // final pokemonData;
  // const HomeScreen({required this.pokemonData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pokemon> pokemon = List.empty();

  // var data = pokemonData;
  // late String pokemonName ;

  // void dataHandler(){
  //   if(data == null ){
  //     pokemonName = 'null';
  //   }
  //   pokemonName = jsonDecode(data);
  // }

  // late int weigth;
  // late int height;
  // late String name;
  // late int id;
  // late String image;

  // dynamic dataHandler(int index) async {
  //   Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$index');
  //   NetworkHelper networkHelper = NetworkHelper(url: url);
  //   var data = await networkHelper.fetchPokemon();
  //   print('data = $data');
  //
  //   // weigth = jsonDecode(data!)['weight'];
  //   // height = jsonDecode(data)['height'];
  //   // name = jsonDecode(data)['name'];
  //   dynamic image = jsonDecode(data!)['sprites']['other']['dream_world']['front_default'];
  //   return image;
  //   // print('image = $image  name= $name height = $height weight = $height ');
  // }

  // Text nameHandler(int index) async {
  //   Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$index');
  //   NetworkHelper networkHelper = NetworkHelper(url: url);
  //   var data = await networkHelper.fetchPokemon();
  //   name = jsonDecode(data!)['name'];
  //   print('name = $name');
  //   return Text(name);
  // }
  //
  // dynamic nameHandler(int index) async {
  //   Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$index');
  //   NetworkHelper networkHelper = NetworkHelper(url: url);
  //   var data = await networkHelper.fetchPokemon();
  //   image = jsonDecode(data!)['sprites']['other']['dream_world']['front_default'];
  //   print('image = $image');
  //   return Image.network(image) ;
  // }

  void getPokemonFromPokeApi() async {
    PokeAPI.getPokemon().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {

          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
          // element.value['weight'] = jsonDecode(element.value['url'])['weight'];
          print(element);
          return Pokemon.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPokemonFromPokeApi();
    // dataHandler(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 80,
            color: Colors.redAccent,
            child: const Text('Pokedex',
                style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // print('image$index  = $image');
          // Future<dynamic> image = dataHandler(index);
          if(index<249) {
            return Column(
            children: [
              SizedBox(
                  height: 1,
                  child: Container(
                    color: Colors.grey,
                  ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PokemonScreen(
                            // pokemonWeight:pokemon[index].weight,
                            pokemonName: pokemon[index].name,
                            pokemonImg: pokemon[index].img,
                          ),
                  ),
                ),
                child: ListTile(
                  leading: Image.network(
                    pokemon[index].img,
                    width: 100,
                    height: 100,
                  ),
                  trailing: Text(
                    '${pokemon[index].name}'
                        // '${pokemon[index].weight}'
                    ,
                    style: const TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
          }
        },
      ),
    );
  }
}
