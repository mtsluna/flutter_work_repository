import 'dart:async';
import 'dart:convert';

import 'package:movie_app/src/models/actor_model.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider{

  String _apiKey = 'c8816b939263905a9e3f2eed5f03e279';
  String _url = 'api.themoviedb.org';
  String _language = 'es_ES';
  int _popularesPage = 0;
  List<Movie> _populares = new List();
  final _popularesStream = StreamController<List<Movie>>.broadcast();
  bool _cargando = false;

  Function(List<Movie>) get popularesSink => _popularesStream.sink.add;
  Stream<List<Movie>> get popularesStream => _popularesStream.stream;

  Future<List<Movie>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language
    });

    return await getData(url);

  }

  Future<List<Actor>> getActors(String peliId) async {

    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key': _apiKey,
      'language': _language
    });

    final resp = await http.get(url);
    final decoded = json.decode(resp.body);
    final cast = new Actors.fromJsonList(decoded['cast']);
    return cast.actors;

  }

  Future<List<Movie>> getPopulares() async {
   
    if(_cargando) return [];

    _cargando = true;

    _popularesPage++;    

    void disposeStreams(){
      _popularesStream?.close();
    }


    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await getData(url);

    _populares.addAll(resp);
    _popularesStream.sink.add(_populares);

    _cargando = false;
    return resp;

  }

  Future<List<Movie>> getData(url) async{
    final response = await http.get(url);
    final decoded = json.decode(response.body);
    final movies = new Movies.fromJsonList(decoded['results']);
    return movies.items;
  }

  Future<List<Movie>> searchMovie(String query) async {

    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    return await getData(url);

  }

}