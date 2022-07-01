import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:marvel_test/src/models/results.dart';
import 'package:marvel_test/src/views/Details/detail_view.dart';
import 'package:marvel_test/src/views/Home/components/heroes_list/heroes_list_description.dart';

class HeroesListCard extends StatelessWidget {
  const HeroesListCard(this.heroSelected, {Key? key}) : super(key: key);
  final Results heroSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.bottomSheet(
        DetailView(heroSelected.id!),
        isScrollControlled: true,
        enableDrag: true,
      ),
      child: Card(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                "${heroSelected.thumbnail!.path!}/portrait_xlarge.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 3,
              child: HeroesListDescription(heroSelected),
            ),
          ],
        ),
      ),
    );
  }
}
