// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:pokedex/models/pokemon.dart';
//
// class NetworkHelper{
//
//   final Uri url;
//   NetworkHelper({required this.url});
//
//   Future<String?> fetchPokemon() async {
//     http.Response response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       String body = response.body;
//       // print(body);
//       return body;
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
// }


import 'dart:async';
import 'package:http/http.dart' as http;
class PokeAPI {
  static Future<http.Response> getPokemon() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=250"));
}