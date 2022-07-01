import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:marvel_test/src/models/results.dart';
import 'package:marvel_test/src/view_models/character_view_model.dart';
import 'package:marvel_test/src/views/Home/components/heroes_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    CharacterViewModel viewModel = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Center(
              child: InkWell(
                onTap: (() => viewModel.getCharacters()),
                child: const Text("Listar Heróis"),
              ),
            ),
            viewModel.characterResponse != null
                ? HeroesList()
                // ? ListView.builder(
                //     physics: const ClampingScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: viewModel.characterResponse!.results!.length,
                //     itemBuilder: (context, index) {
                //       Results results = viewModel.characterResponse!.results![index];
                //       return InkWell(
                //         onTap: () => Get.toNamed('/details', arguments: results.id),
                //         child: Column(children: [
                //           Text(results.name!),
                //           Image.network("${results.thumbnail!.path!}/portrait_small.jpg")
                //         ]),
                //       );
                //     },
                //   )
                : Container()
          ]),
        ),
      ),
    );
  }
}
