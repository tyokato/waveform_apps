import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waveform_apps/layouts/karakteristik_gelombang.dart';

import '../../colors/color.dart';

class GelombangGangguanPohon extends StatelessWidget {
  const GelombangGangguanPohon({super.key});

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
                Positioned(child: TitleKarakteristikGelombang()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TitleKarakteristikGelombang extends StatelessWidget {
  const TitleKarakteristikGelombang({super.key});

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
                  SvgPicture.asset(
                    'assets/images/wave_sine.svg',
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
                          'KARAKTERISTIK GELOMBANG GANGGUAN',
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
              TitleGelombangGangguanPohon(),
            ],
          )
        ],
      ),
    );
  }
}

class TitleGelombangGangguanPohon extends StatelessWidget {
  const TitleGelombangGangguanPohon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            'Gelombang Gangguan Pohon',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Jost', fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              children: [
                TextDummyGangguan(text: """
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

              Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.

              Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla nunc dui, tristique in semper vel, congue sed ligula. Nam dolor ligula, faucibus id sodales in, auctor fringilla libero. Pellentesque pellentesque tempor tellus eget hendrerit. Morbi id quam nisl. Nulla facilisi. Praesent pulvinar, sapien vel feugiat vestibulum, nulla dui pretium orci, non ultricies elit lacus quis ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci.
                """)
              ],
            ),
          )
        ],
      ),
    );
  }
}

