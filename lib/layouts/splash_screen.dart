import 'dart:async';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/color.dart';


// Page Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: HomeBackgroundScreen()),
          Positioned(child: LogoSplash())
        ],
      ),
    );
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

class LogoSplash extends StatelessWidget {
  const LogoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
              child: Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(20),
                color: Colors.white.withOpacity(0.1),
                child: Center(
                  child: Image.asset(
                    'assets/images/pln_logo.png',
                    width: 200,
                    height: 500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
