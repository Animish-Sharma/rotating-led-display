import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loading {
  void onLoading(BuildContext context, double width, double height) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            width: width / 1.1,
            height: height / 4,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "Loading......",
                    style: GoogleFonts.poppins(fontSize: width / 10),
                  ),
                )
              ],
            ),
          );
        });
  }
}
