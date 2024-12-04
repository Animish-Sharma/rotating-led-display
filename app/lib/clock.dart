import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kala_tara/server/clienturl.dart';
import 'package:one_clock/one_clock.dart';
import 'package:uno/uno.dart';
import "package:http/http.dart" as http;

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  var response;
  String notAvail = "Not Connected to Arduino";
  final _clientServie = ClientUrl();
  final uno = Uno();
  bool isAnalog = true;
  String avail = "Connected to Arduino";
  String _status = "";
  bool isAvail = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int index = 0;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: TextStyle(color: isAvail ? Colors.green : Colors.red)),
            ],
          ),
          SizedBox(height: height / 90),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Date and Time",
              style: GoogleFonts.rubik(
                  fontSize: height / 35, fontWeight: FontWeight.w100),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  turnClock1On();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff97D2FB),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Color(0xff97D2FB))),
                ),
                child: Text(
                  "Time",
                  style: GoogleFonts.dmSans(
                      color: const Color(0xff204699),
                      fontWeight: FontWeight.w800,
                      fontSize: width / 25),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  turnClock2On();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffCBC5EA),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(color: Color(0xffCBC5EA))),
                ),
                child: Text(
                  "Date 1",
                  style: GoogleFonts.dmSans(
                      color: const Color(0xff514468),
                      fontWeight: FontWeight.bold,
                      fontSize: width / 25),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  turnClock3On();
                  await _clientServie.changeClock(3);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF2E3BC),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(color: Color(0xffF2E3BC))),
                ),
                child: Text(
                  "Date 2",
                  style: GoogleFonts.dmSans(
                      color: const Color(0xff906542),
                      fontWeight: FontWeight.bold,
                      fontSize: width / 25),
                ),
              ),
            ],
          ),
          SizedBox(height: height / 8),
          isAnalog
              ? SizedBox(
                  width: width,
                  height: height / 4,
                  child: AnalogClock(
                    isLive: true,
                    hourHandColor: Colors.black,
                    minuteHandColor: Colors.black,
                    showSecondHand: true,
                    numberColor: Colors.black87,
                    showNumbers: true,
                    showAllNumbers: false,
                    textScaleFactor: 1.2,
                    showTicks: false,
                    showDigitalClock: false,
                    datetime: DateTime.now(),
                  ),
                )
              : Center(
                child: SizedBox(
                    width: width / 1.3,
                    height: height / 5.2,
                    child: DigitalClock(
                        showSeconds: true,
                        digitalClockTextColor: const Color(0xff444444),
                        isLive: true,
                        textScaleFactor: 1.5,
                        decoration: BoxDecoration(
                          
                            color: const Color(0xffc0c7c2).withOpacity(0.2),
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.all(Radius.circular(15))),
                        datetime: DateTime.now()),
                  ),
              ),
          SizedBox(height: height / 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isAnalog = !isAnalog;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff99d98c),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Color(0xff99d98c))),
              ),
              child: Text(
                "Change Clock",
                style: GoogleFonts.dmSans(
                    color: const Color(0xff004b23),
                    fontWeight: FontWeight.w800,
                    fontSize: width / 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
  turnClock1On() async {
    await _clientServie.changeClock(1);
    print("Clock 1 (Text) turned on");
    try {
      setState(() {
        _status = avail;
      });
    } catch (e) {
      print(e);
      if(mounted){
        setState(() {
          _status = notAvail;
        });
      }
    }
  }
  void turnClock2On() async {
    print("Clock 2 (Display) turned on");
    try {
      setState(() {
        _status = avail;
      });
      await _clientServie.changeClock(2);
    } catch (e) {
      print(e);
      if(mounted){
        setState(() {
          _status = notAvail;
        });
      }
    }
  }
  void turnClock3On() async {
    await _clientServie.changeClock(3);
    print("Clock 3 (Spl) turned on");
    try {
      setState(() {
        _status = avail;
      });
    } catch (e) {
      print(e);
      if(mounted){
        setState(() {
          _status = notAvail;
        });
      }
    }
  }
}
