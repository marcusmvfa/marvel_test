import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_test/src/models/results.dart';
import 'package:marvel_test/src/views/Home/components/more_info_card.dart';

class HeroesListDescription extends StatelessWidget {
  const HeroesListDescription(this.heroSelected, {Key? key}) : super(key: key);
  final Results heroSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              heroSelected.name!,
              style: GoogleFonts.barlow(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 32),
            child: Text(heroSelected.description!,
                maxLines: 4, overflow: TextOverflow.ellipsis, style: GoogleFonts.barlow()),
          ),
          const MoreInfo()
        ],
      ),
    );
  }
}
