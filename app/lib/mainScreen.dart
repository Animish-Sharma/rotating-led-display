// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kala_tara/clock.dart';
import 'package:kala_tara/image.dart';
import 'package:kala_tara/scribble.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  String notAvail = "Not Connected to Arduino";
  String avail = "Connected to Arduino";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    bool isAvail = true;
    double width = MediaQuery.of(context).size.width;
    bool isSelected = false;

    final List<Widget> screens = [
      const ClockScreen(),
      ScribblePage(),
    ];
    return Scaffold(
      extendBody: true,
      body: Container(
          padding: EdgeInsets.only(top: height / 15), child: screens[index]),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(fontSize: height / 70),
            currentIndex: index,
            backgroundColor: const Color(0xff252323),
            onTap: (val) {
              setState(() {
                index = val;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.alarm,
                    color: Color(0xff7f7f7f),
                  ),
                  label: 'Clock',
                  activeIcon: Icon(
                    Icons.alarm,
                    color: const Color(0xfffafaff),
                    size: height / 26,
                  )),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.edit,
                  color: Color(0xff7f7f7f),
                ),
                label: 'Text',
                activeIcon: Icon(
                  Icons.edit,
                  color: const Color(0xfffafaff),
                  size: height / 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
