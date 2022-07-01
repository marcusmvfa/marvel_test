import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderBtn extends StatelessWidget {
  const OrderBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.red),
            child: Text(
              "A-Z",
              style: GoogleFonts.barlow(
                  fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
            child: Text(
              "Last Viewed",
              style: GoogleFonts.barlow(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
