import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kala_tara/server/clienturl.dart';

class ScribblePage extends StatefulWidget {
  const ScribblePage({super.key});

  @override
  State<ScribblePage> createState() => _ScribblePageState();
}

class _ScribblePageState extends State<ScribblePage> {
  bool isAvail = true;

  String notAvail = "Not Connected to Arduino";

  String avail = "Connected to Arduino";

  final TextEditingController _textEditingController = TextEditingController();
  ClientUrl _client = ClientUrl();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Arduino + Flutter",
                style: TextStyle(
                  fontSize: width / 25,
                ),
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
                      style:
                          TextStyle(color: isAvail ? Colors.green : Colors.red)),
                ],
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Text",
                  style: GoogleFonts.rubik(
                      fontSize: height / 30, fontWeight: FontWeight.w100),
                ),
              ),
              SizedBox(
                width: width / 1.05,
                child: Image.asset("assets/text.png"),
              ),
              SizedBox(height: height / 20),
              SizedBox(
                width: width / 1.2,
                height: height / 4.4,
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    label: Text("Text"),
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              ElevatedButton(
                    onPressed: () {
                      _client.changeText(_textEditingController.text);
                    },
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
                          fontSize: width / 25),
                    ),
              ),
          ],
        ),
      ),
    );
  }
}