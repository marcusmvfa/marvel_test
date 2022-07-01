import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_test/src/view_models/character_view_model.dart';
import 'package:marvel_test/src/views/Home/components/heroes_list/heroes_list.dart';
import 'package:marvel_test/src/views/Home/components/order_btn.dart';
import 'package:marvel_test/src/views/Home/components/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    CharacterViewModel viewModel = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SearchBar(),
            const OrderBtn(),
            viewModel.characterResponse != null ? const HeroesList() : Container()
          ]),
        ),
      ),
    );
  }
}
