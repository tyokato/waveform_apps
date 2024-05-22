import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waveform_apps/layouts/parts/gelombang_gangguan_hewan.dart';
import 'package:waveform_apps/layouts/parts/gelombang_gangguan_kabel.dart';
import 'package:waveform_apps/layouts/parts/gelombang_gangguan_petir.dart';
import 'package:waveform_apps/layouts/parts/gelombang_gangguan_pohon.dart';

import '../colors/color.dart';


// Page Karakteristik Gelombang
class KarakteristikGelombang extends StatelessWidget {
  const KarakteristikGelombang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
            Stack(
              children: [
                Positioned(child: BackgroundScreenMenu()),
                Positioned(child: TitleKarakteristikGelombang()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        )
                    ),
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 255, 15, 15),
                          child: Center(
                            child: Container(
                              width: 275,
                              height: 50,
                              padding: EdgeInsets.all(0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GelombangGangguanPetir(), ));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  backgroundColor: CustomColors.Ziggurat
                                ),
                                child: Text(
                                  'Gangguan Petir',
                                  style: TextStyle(fontSize: 18, fontFamily: 'Jost', fontWeight: FontWeight.bold, letterSpacing: 0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Center(
                            child: Container(
                              width: 275,
                              height: 50,
                              padding: EdgeInsets.all(0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GelombangGangguanPohon()));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  backgroundColor: CustomColors.Tropical_Blue
                                ),
                                child: Text(
                                  'Gangguan Pohon',
                                  style: TextStyle(fontSize: 18, fontFamily: 'Jost', fontWeight: FontWeight.bold, letterSpacing: 0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Center(
                            child: Container(
                              width: 275,
                              height: 50,
                              padding: EdgeInsets.all(0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GelombangGangguanHewan()));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  backgroundColor: CustomColors.Ziggurat
                                ),
                                child: Text(
                                  'Gangguan Hewan',
                                  style: TextStyle(fontSize: 18, fontFamily: 'Jost', fontWeight: FontWeight.bold, letterSpacing: 0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Center(
                            child: Container(
                              width: 275,
                              height: 50,
                              padding: EdgeInsets.all(0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GelombangGangguanKabel()));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  backgroundColor: CustomColors.Tropical_Blue
                                ),
                                child: Text(
                                  'Gangguan Kabel',
                                  style: TextStyle(fontSize: 18, fontFamily: 'Jost', fontWeight: FontWeight.bold, letterSpacing: 0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                )

              ],
            ),
      )
    );
  }
}

// Widget
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
                        stops: [0.0, 0.2, 0.5, 0.9, 1.0]
                    )
                ),
              ),
            ),Positioned(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                  child: SizedBox(),
                )
            ),
          ]
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
                  color: Colors.black26,
                  blurRadius: 5.0,
                  spreadRadius: 1.0
              )
            ]
        ),
        child: Center(
          child: Icon(
            icon, size: iconSize, color: color,
          ),
        ),
      ),
    );
  }
}

class TitleKarakteristikGelombang extends StatelessWidget {
  const TitleKarakteristikGelombang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(70, 120, 15, 25),
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/wave_sine.svg', height: 90,),
          SizedBox(width: 30,),
          Container(
            width: 180,
            child: Wrap(
              children: [
                Text(
                  'KARAKTERISTIK GELOMBANG GANGGUAN',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Jost', letterSpacing: 0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextDummyGangguan extends StatelessWidget {
  final String text;

  TextDummyGangguan({required this.text});

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpan = text.split('\n\n').map((paragraph) {
      return TextSpan(
        text: '\t$paragraph\n\n',
        style: TextStyle(fontSize: 16, height: 1.5),
      );
    }).toList();
    return Container(
        child: RichText(
          text: TextSpan(
            children: textSpan,
            style: TextStyle(color: Colors.black),
          ),
          textAlign: TextAlign.justify,
        ));
  }
}


