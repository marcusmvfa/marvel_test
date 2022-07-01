import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_test/src/view_models/character_view_model.dart';

class DetailView extends StatefulWidget {
  const DetailView(this.heroId, {Key? key}) : super(key: key);
  final int heroId;
  static const routeName = '/details';
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> with SingleTickerProviderStateMixin {
  static const routeName = '/details';
  late int heroId;
  CharacterViewModel viewModel = Get.find();
  late AnimationController animation;
  @override
  void initState() {
    heroId = widget.heroId;
    animation = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        animationController: animation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        clipBehavior: Clip.hardEdge,
        onClosing: () {},
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.90),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(0),
            child: FutureBuilder(
              future: viewModel.getCharacterById(heroId),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return Column(
                    // ListView(
                    //   shrinkWrap: true,
                    children: [
                      Image.network(
                          "${viewModel.heroSelected!.thumbnail!.path}/portrait_uncanny.jpg",
                          fit: BoxFit.fill),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Flexible(
                              flex: 8,
                              child: Text(
                                viewModel.heroSelected!.name!,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style:
                                    GoogleFonts.barlow(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                            text: viewModel.heroSelected!.urls!.first.url))
                                        .then((_) {
                                      Get.snackbar("Share", "Link copied to clipboard",
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Colors.white60,
                                          colorText: Colors.black);
                                    });
                                  },
                                  icon: const Icon(Icons.ios_share_rounded)),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            viewModel.heroSelected!.description!,
                            style: GoogleFonts.barlow(fontSize: 18),
                          ),
                        ),
                      ]),
                    ],
                  );
                }
              }),
            ),
          );
        });
  }
}
