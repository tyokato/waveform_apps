import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/color.dart';

class PenggunaanAplikasi extends StatelessWidget {
  const PenggunaanAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: BackgroundScreenMenu()),
          SingleChildScrollView(
            child: Column(
              children: [
                Positioned(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: IconButtonBack(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icons.arrow_back_ios_new_rounded,
                      color: CustomColors.Black,
                      size: 40,
                      iconSize: 20,
                    ),
                  ),
                ),
                Positioned(child: TitlePenggunaanAplikasi()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundScreenMenu extends StatelessWidget {
  const BackgroundScreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    CustomColors.Parchment,
                    CustomColors.Parchment,
                    CustomColors.Tropical_Blue,
                    CustomColors.Tropical_Blue,
                    CustomColors.Tropical_Blue,
                  ],
                  stops: [0.0, 0.2, 0.5, 0.9, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
              child: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class IconButtonBack extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final Color color;
  final VoidCallback onPressed;

  IconButtonBack({
    required this.icon,
    required this.size,
    required this.iconSize,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 5.0, spreadRadius: 1.0)
            ]),
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: color,
          ),
        ),
      ),
    );
  }
}

class TitlePenggunaanAplikasi extends StatelessWidget {
  const TitlePenggunaanAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(10, 50, 0, 25),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/tower.png',
                    height: 90,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 180,
                    child: Wrap(
                      children: [
                        Text(
                          'TATA CARA PENGGUNAAN APLIKASI',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jost',
                              letterSpacing: 0),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
              CaraPenggunaanAplikasi(),
              RulesDeteksiTrouble(),
              RulesKarakteristikGangguan()
            ],
          )
        ],
      ),
    );
  }
}

class CaraPenggunaanAplikasi extends StatelessWidget {
  final List<String> items = [
    'Deteksi Trouble - Digunakan untuk mengetahui gangguan disebabkan oleh apa',
    'Karakteristik Gangguan - Digunakan untuk mengetahui karakteristik secara umum dari setiap gangguan',
    'Tata Cara Penggunaan Aplikasi - Digunakan untuk memberi petunjuk penggunaan aplikasi',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            'Cara Menggunakan Aplikasi',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Jost', fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 360),
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CustomColors.Ziggurat,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: <Widget>[
                Text(
                  'Pada halaman awal terdapat beberapa menu, diantaranya :',
                  style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                  textAlign: TextAlign.justify,
                ),
                for (int i = 0; i < items.length; i++)
                  ListTile(
                    leading: Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 10,
                    ),
                    title: Text(
                      '${items[i]}',
                      style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                      textAlign: TextAlign.justify,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RulesKarakteristikGangguan extends StatelessWidget {
  final List<String> items = [
    'Deteksi Trouble - Digunakan untuk mengetahui gangguan disebabkan oleh apa',
    'Karakteristik Gangguan - Digunakan untuk mengetahui karakteristik secara umum dari setiap gangguan',
    'Tata Cara Penggunaan Aplikasi - Digunakan untuk memberi petunjuk penggunaan aplikasi',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            'Karakteristik Gelombang \nGangguan',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Jost', fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 360),
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CustomColors.Ziggurat,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: <Widget>[
                Text(
                  'Pada halaman ini menampilkan detail karakteristik gangguan dari setiap penyebab seperti, petir, hewan, pohon dan kabel. ',
                  style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RulesDeteksiTrouble extends StatelessWidget {
  final List<String> items = [
    'Deteksi Trouble - Digunakan untuk mengetahui gangguan disebabkan oleh apa',
    'Karakteristik Gangguan - Digunakan untuk mengetahui karakteristik secara umum dari setiap gangguan',
    'Tata Cara Penggunaan Aplikasi - Digunakan untuk memberi petunjuk penggunaan aplikasi',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            'Deteksi Trouble',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Jost', fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 360),
            decoration: BoxDecoration(
                color: CustomColors.Ziggurat,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: CustomColors.Tropical_Blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '1',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 270,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Wrap(
                    children: [
                      Text(
                        'Siapkan data terjadi gangguan dalam bentuk .CSV',
                        style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 360),
            decoration: BoxDecoration(
                color: CustomColors.Tropical_Blue,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: CustomColors.Ziggurat,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '2',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 270,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Wrap(
                    children: [
                      Text(
                        'Masukkan tempat terjadi gangguan, waktu, dan Data gangguan yang akan di proses',
                        style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 360),
            decoration: BoxDecoration(
                color: CustomColors.Ziggurat,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: CustomColors.Tropical_Blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '3',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 270,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Wrap(
                    children: [
                      Text(
                        'Tunggu dan akan ditampilkan hasil penyebab gangguan',
                        style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextListWithIcons extends StatelessWidget {
  final List<String> items = [
    'Ini adalah teks pertama',
    'Ini adalah teks kedua',
    'Ini adalah teks ketiga',
    'Ini adalah teks keempat',
    'Ini adalah teks kelima',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Icon(Icons.circle, size: 10.0, color: Colors.blue),
              SizedBox(width: 10.0),
              Expanded(child: Text(item)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
