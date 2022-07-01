import 'dart:developer';

import 'package:dio/dio.dart';

class CharacterService {
  Future getCharacters(String name) async {
    return await Dio().get("http://gateway.marvel.com/v1/public/characters", queryParameters: {
      "apikey": "9bc35e8e14951aaeacca6bbcdecfd73a",
      "hash": "d458a4eca00c397075398f42860a8a62",
      "ts": "1655957413",
      "nameStartsWith": name,
      "limit": 50
    }).catchError((error) {
      debugger();
      print(error);
    });
  }

  Future getCharacterById(int id) async {
    return await Dio().get("http://gateway.marvel.com/v1/public/characters", queryParameters: {
      "apikey": "9bc35e8e14951aaeacca6bbcdecfd73a",
      "hash": "d458a4eca00c397075398f42860a8a62",
      "ts": "1655957413",
      "id": id
    });
  }
}
