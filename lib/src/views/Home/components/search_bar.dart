import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:marvel_test/src/view_models/character_view_model.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  bool isForward = false;
  TextEditingController textEditingController = TextEditingController();
  CharacterViewModel viewModel = Get.find();
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    final curve = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0, end: 250).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Text("Marvel"),
          Container(
            width: animation.value,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: TextField(
                controller: textEditingController,
                onEditingComplete: () => viewModel.getCharacters(textEditingController.text),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "Type your hero!",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: animation.value > 1
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(50))
                    : BorderRadius.circular(50)),
            child: IconButton(
              onPressed: () {
                if (!isForward) {
                  animationController.forward();
                  isForward = true;
                } else {
                  animationController.reverse();
                  isForward = false;
                }
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }
}
