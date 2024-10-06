import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>>  getPokemonPack(offset, limit, offsetUrl) async {
  try {
    Uri url = Uri.https('pokeapi.co', '/api/v2/pokemon/',
        {'offset': '$offset', 'limit': '$limit'});
    if (offsetUrl != null && offsetUrl != "") {
      url = Uri.parse(offsetUrl);
    }
    var response = await http.get(url);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      Map<String, dynamic> iterationResp = {
        "nextIterationUrl": jsonResponse["next"],
        "iterationResults": jsonResponse["results"]
      };
      return iterationResp;
  } catch (e) {
    print('Error fetching data: $e');
    return {};
  }

}

Future<Map<String, dynamic>>  getSinglePokemon(pokemonUrl) async {
  try {
    Uri url = Uri.parse(pokemonUrl);
    var response = await http.get(url);
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    return jsonResponse;
  } catch (e) {
    print('Error fetching data: $e');
    return {};
  }

}
