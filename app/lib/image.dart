import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  XFile? image;

  bool isAvail = true;

  String notAvail = "Not Connected to Arduino";

  String avail = "Connected to Arduino";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: WHEN NOT CONNECTED LOG OUT
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: <Widget>[
          Text(
            "Arduino + Flutter",
            style: TextStyle(
              fontSize: width / 25,
            ),
          ),
          SizedBox(height: height / 160),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isAvail
                    ? Icons.wifi_tethering_rounded
                    : Icons.wifi_tethering_error_rounded_sharp,
                color: isAvail ? Colors.green : Colors.red,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(isAvail ? avail : notAvail,
                  style: TextStyle(color: isAvail ? Colors.green : Colors.red)),
            ],
          ),
          SizedBox(height: height / 90),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Image",
              style: GoogleFonts.rubik(
                  fontSize: height / 35, fontWeight: FontWeight.w100),
            ),
          ),
          const SizedBox(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _getImage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffc2d1),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Color(0xffffc2d1))),
                ),
                child: Text(
                  "Image",
                  style: GoogleFonts.dmSans(
                      color: const Color(0xffeb396c),
                      fontWeight: FontWeight.w800,
                      fontSize: width / 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffCBC5EA),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(color: Color(0xffCBC5EA))),
                ),
                child: Text(
                  "GIF",
                  style: GoogleFonts.dmSans(
                      color: const Color(0xff514468),
                      fontWeight: FontWeight.bold,
                      fontSize: width / 30),
                ),
              ),
            ],
          ),
          SizedBox(height: height / 8),
          //? Text("No Image / GIF Selected", style: GoogleFonts.dmSans(fontSize: width / 20),)
          GestureDetector(
            onTap: () {
              _getImage();
            },
            child: ClipRRect(
              child: CircleAvatar(
                radius: width / 3.5,
                backgroundImage:
                    image != null ? FileImage(File(image!.path)) : null,
              ),
            ),
          ),
          SizedBox(height: height / 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff99d98c),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Color(0xff99d98c))),
            ),
            child: Text(
              "Upload",
              style: GoogleFonts.dmSans(
                  color: const Color(0xff31572c),
                  fontWeight: FontWeight.w800,
                  fontSize: width / 27.5),
            ),
          ),
        ],
      ),
    );
  }

  void _getImage() async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (img != null) {
        image = img;
      }
    });
  }
}
