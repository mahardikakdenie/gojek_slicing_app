import 'package:flutter/material.dart';
import 'theme.dart'; // Pastikan import ini mengarah ke file yang benar.

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // Menyimpan indeks container yang aktif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        elevation: 0,
        toolbarHeight: 71,
        title: _buildCustomAppBar(),
      ),
    );
  }

  Widget _buildCustomAppBar() {
    // List berisi widget container teks
    List<Widget> containers = [
      _buildGestureContainer(0, "Beranda", Colors.transparent),
      _buildGestureContainer(1, "Gopay", Colors.transparent),
      _buildGestureContainer(2, "Gojek", Colors.transparent),
    ];

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: green1,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: containers,
      ),
    );
  }

  // Membuat widget container dengan gesture untuk tiap item
  Widget _buildGestureContainer(int index, String text, Color initialBgColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Set container yang aktif
        });
      },
      child: _buildTextContainer(
        text: text,
        backgroundColor: (selectedIndex == index) ? green2 : initialBgColor,
        textColor: (selectedIndex == index) ? Colors.white : Colors.black,
        index: index,
      ),
    );
  }

  // Widget untuk membangun kontainer teks
  Widget _buildTextContainer(
      {required String text,
      required Color backgroundColor,
      required Color textColor,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "$text - $index",
          style: semibold14.copyWith(color: textColor),
        ),
      ),
    );
  }
}
