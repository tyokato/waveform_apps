import 'dart:ui';
import 'dart:math' as math;

import 'package:waveform_apps/layouts/deteksi_trouble.dart';
import 'package:waveform_apps/layouts/karakteristik_gelombang.dart';
import 'package:waveform_apps/layouts/penggunaan_aplikasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/color.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(child: HomeBackgroundScreen()),
        Column(
          children: [
            Positioned(child: GreetingsLottie()),
            Positioned(child: MenuRow1()),
            Positioned(child: MenuRow2()),
          ],
        ),
      ],
    ));
  }
}

class HomeBackgroundScreen extends StatelessWidget {
  const HomeBackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: double.infinity),
        color: CustomColors.Parchment,
        child: Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: math.pi,
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          200), // Atur ukuran sesuai kebutuhan Anda
                      painter: HalfCirclePainter(
                          orientation: HalfCircleOrientation.top),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      color: CustomColors.Havelock_Blue, // Warna kotak panjang
                    ),
                  ),
                  Positioned(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          200), // Atur ukuran sesuai kebutuhan Anda
                      painter: HalfCirclePainter(
                          orientation: HalfCircleOrientation.top),
                    ),
                  ),
                ]),
            Positioned(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
              child: SizedBox(),
            ))
          ],
        ));
  }
}

enum HalfCircleOrientation { top, bottom }

class HalfCirclePainter extends CustomPainter {
  final HalfCircleOrientation orientation;

  HalfCirclePainter({required this.orientation});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = CustomColors.Denim
      ..style = PaintingStyle.fill;

    double radius = size.height * 1.4;
    Offset center;

    if (orientation == HalfCircleOrientation.top) {
      center = Offset(size.width / 2, size.height / 0.53);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi,
        math.pi,
        true,
        paint,
      );
    } else {
      center = Offset(size.width / 2, 0);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi,
        math.pi,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class GreetingsLottie extends StatelessWidget {
  const GreetingsLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: double.infinity),
      margin: EdgeInsets.fromLTRB(10, 120, 10, 25),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/man_pose.png', width: 200,),
              Container(
                width: 180,
                child: Wrap(
                  children: [
                    Text(
                      'SUTT Aman, Listrik Lancar, Laporkan Gangguan',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jost'),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MenuRow1 extends StatelessWidget {
  const MenuRow1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: double.infinity, maxHeight: double.infinity),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ButtonMenu(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      color: Colors.white.withOpacity(0.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                          child: Container(
                            width: 200,
                            height: 200,
                            padding: EdgeInsets.all(20),
                            color: Colors.white.withOpacity(0.15),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/image_search.svg',
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeteksiTrouble()));
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Deteksi Trouble',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 27),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ButtonMenu(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      color: Colors.white.withOpacity(0.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                          child: Container(
                            width: 200,
                            height: 200,
                            padding: EdgeInsets.all(20),
                            color: Colors.white.withOpacity(0.15),
                            child: Center(
                                child: SvgPicture.asset(
                              'assets/images/wave_sine.svg',
                              width: 200,
                              height: 200,
                            )),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    KarakteristikGelombang()));
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 120,
                  child: Wrap(
                    children: [
                      Text(
                        'Karakteristik Gelombang',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuRow2 extends StatelessWidget {
  const MenuRow2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: double.infinity, maxHeight: double.infinity),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ButtonMenu(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      color: Colors.white.withOpacity(0.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                          child: Container(
                            width: 200,
                            height: 200,
                            padding: EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.45),
                            child: Center(
                              child: Image.asset(
                                'assets/images/tower.png',
                                width: 200,
                                height: 500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PenggunaanAplikasi()));
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 180,
                  child: Wrap(
                    children: [
                      Text(
                        'Tata Cara Penggunaan Aplikasi',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonMenu extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final double elevation;

  ButtonMenu(
      {required this.child,
      required this.onTap,
      this.color = CustomColors.Ziggurat,
      this.borderRadius = 8.0,
      this.padding =
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      this.elevation = 1.0});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                if (elevation > 0)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, elevation),
                    blurRadius: elevation,
                  )
              ]),
          child: Center(child: child),
        ),
      ),
    );
  }
}
