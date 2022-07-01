import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:marvel_test/src/view_models/character_view_model.dart';
import 'package:marvel_test/src/views/Home/components/heroes_list_card.dart';

class HeroesList extends StatefulWidget {
  const HeroesList({Key? key}) : super(key: key);

  @override
  State<HeroesList> createState() => _HeroesListState();
}

class _HeroesListState extends State<HeroesList> {
  CharacterViewModel viewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          key: UniqueKey(),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: viewModel.heroesList.length,
          itemBuilder: (context, index) {
            return HeroesListCard(viewModel.heroesList[index]);
          }),
    );
  }
}
