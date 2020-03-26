import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey    = "634eb55e349113cdc96234cae7b58f19";
  String _url       = "api.themoviedb.org";
  String _lenguage  = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri uri) async {
    final respuesta = await http.get(uri);

    final decodedData = json.decode(respuesta.body);
    final peliculas   = Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }
  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'   : _apikey,
      'language'  : _lenguage,
    });
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'   : _apikey,
      'language'  : _lenguage,
    });

    return await _procesarRespuesta(url);
  }
}