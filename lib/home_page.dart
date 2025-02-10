import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: green2,
          elevation: 0,
          toolbarHeight: 71,
          title: _buildCustomAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 23, left: 15, right: 15, bottom: 0),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0xFFE5E5E5))),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/search.svg',
                              width: 20,
                              height: 20,
                              colorFilter:
                                  ColorFilter.mode(dark3, BlendMode.srcIn),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Cari Layanan, Makanan, dan Tujuan",
                              style: regular14.copyWith(color: dark3),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35 / 2),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset("assets/images/avatar.png"),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              width: 16,
                              height: 16,
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35 / 2),
                                    color: const Color(0xFFD1E7EE)),
                                child: SvgPicture.asset(
                                  'assets/icons/goclub.svg',
                                  colorFilter:
                                      ColorFilter.mode(blue2, BlendMode.srcIn),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildCustomAppBar() {
    // List berisi widget container teks
    List<Widget> containers = [
      _buildGestureContainer(0, "Beranda", Colors.transparent),
      _buildGestureContainer(1, "Promo", Colors.transparent),
      _buildGestureContainer(2, "Pesanan", Colors.transparent),
      _buildGestureContainer(3, "Chat", Colors.transparent),
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
        textColor: Colors.white,
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
          text,
          style: semibold14.copyWith(color: textColor),
        ),
      ),
    );
  }
}
