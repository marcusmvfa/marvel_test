import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:marvel_test/src/models/character_response.dart';
import 'package:marvel_test/src/models/results.dart';
import 'package:marvel_test/src/services/character_service.dart';

class CharacterViewModel extends GetxController {
  CharacterResponse? characterResponse;
  Results? heroSelected;
  var heroesList = <Results>[].obs;
  var lastViewedHeroesList = <Results>[].obs;
  getCharacters(String name) async {
    await CharacterService().getCharacters(name).then((value) {
      characterResponse = CharacterResponse.fromJson(value.data['data']);
      heroesList.value = characterResponse!.results!;
    });
  }

  getCharacterById(int arguments) async {
    await CharacterService().getCharacterById(arguments).then((value) {
      heroSelected = CharacterResponse.fromJson(value.data['data']).results!.first;
      if (lastViewedHeroesList.length < 5) lastViewedHeroesList.value.add(heroSelected!);
    });
  }
}
