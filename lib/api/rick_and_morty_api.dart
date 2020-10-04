import 'dart:convert';

import 'package:http/http.dart' as http;

class RickAndMortyApi {
  String _searchCharacter;
  String _searchLocation;
  String _searchEpisode;

  getCharacters({String search, String formattedUrl = ''}) async {
    try {
      _searchCharacter = search;
      http.Response response;

      if (_searchCharacter == null && formattedUrl.isEmpty) {
        response = await http.get('https://rickandmortyapi.com/api/character/');
      } else if (_searchCharacter == null && formattedUrl.isNotEmpty) {
        response = await http.get(formattedUrl);
      } else {
        response = await http.get(
            'https://rickandmortyapi.com/api/character/?name=$_searchCharacter');
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print('error api');
      print(e);
      throw Exception('Error to load characters');
    }
  }

  getLocations({String search}) async {
    try {
      _searchLocation = search;
      http.Response response;
      if (_searchLocation == null) {
        response = await http.get('https://rickandmortyapi.com/api/location/');
      } else {
        response = await http.get(
            'https://rickandmortyapi.com/api/location/?name=$_searchLocation');
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print(e);
      throw Exception('Error to load locations');
    }
  }

  getEpisodes({String search}) async {
    try {
      _searchEpisode = search;
      http.Response response;
      if (_searchEpisode == null) {
        response = await http.get('https://rickandmortyapi.com/api/episode/');
      } else {
        response = await http.get(
            'https://rickandmortyapi.com/api/episode/?name=$_searchEpisode');
      }
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print(e);
      throw Exception('Error to load episodes');
    }
  }

  getEpisodePage(String urlWithPage) async {
    try {
      http.Response response;

      response = await http.get(urlWithPage);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print(e);
      throw Exception('Error to load episodes page');
    }
  }

  getLocationPage(int page) async {
    try {
      http.Response response;

      response = await http.get('https://rickandmortyapi.com/api/location?page=$page');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print(e);
      throw Exception('Error to load locations page');
    }
  }
}
