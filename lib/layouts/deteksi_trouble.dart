import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../colors/color.dart';


// Page Deteksi Trouble
class DeteksiTrouble extends StatefulWidget {
  const DeteksiTrouble({super.key});

  @override
  State<DeteksiTrouble> createState() => _DeteksiTroubleState();
}

class _DeteksiTroubleState extends State<DeteksiTrouble> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: BackgroundScreenMenu()),
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                Positioned(child: TitleDeteksiTrouble()),
                Positioned(child: FormDokumen()),
              ],
            ),
          ),
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

class TitleDeteksiTrouble extends StatelessWidget {
  const TitleDeteksiTrouble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 50, 15, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/image_search.svg',
            width: 90,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'DETEKSI TROUBLE',
            style: TextStyle(
                letterSpacing: 0,
                fontFamily: 'Jost',
                fontWeight: FontWeight.bold,
                fontSize: 22),
          )
        ],
      ),
    );
  }
}

class FormDokumen extends StatefulWidget {
  const FormDokumen({super.key});

  @override
  State<FormDokumen> createState() => _FormDokumenState();
}

class _FormDokumenState extends State<FormDokumen> {
  TextEditingController _textController = TextEditingController();
  FocusNode _textFocusNode = FocusNode();
  String _selectedTimeString = 'Pilih Waktu';
  String? fileName;
  File? selectedFile;

  void _unfocusTextField() {
    if (_textController.text.isEmpty) {
      _textFocusNode.unfocus();
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        final now = DateTime.now();
        final selectedDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          picked.hour,
          picked.minute,
        );
        _selectedTimeString = DateFormat('HH:mm').format(selectedDateTime);
      });
    }
  }

  void pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          fileName = result.files.single.name;
          selectedFile = File(result.files.single.path!);
        });
      } else {
        print('No file selected or user canceled');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  void submitFile() async {
    if (selectedFile == null) {
      print('No file selected');
      return;
    }

    // Simpan file ke server
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://your-api-endpoint.com/upload'),
    );

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      selectedFile!.path,
    ));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully');
      // Lakukan apa pun yang diperlukan setelah file terunggah
    } else {
      print('Failed to upload file');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.fromLTRB(25, 40, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tempat Terjadi Gangguan', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold),),
                SizedBox(height: 8.0,),
                TextField(
                  controller: _textController,
                  focusNode: _textFocusNode,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, width: 2.0
                      )
                    ),
                    hintText: 'TextField Biasa',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontFamily: 'Jost'),
                ),
                SizedBox(height: 20),
                Text('Waktu Kejadian', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold),),
                SizedBox(height: 6.0,),
                ElevatedButton(
                  onPressed: () {
                    _selectTime(context);
                    _unfocusTextField();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Warna border
                      side: BorderSide(color: Colors.black87.withOpacity(0.7)),
                    ),
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(_selectedTimeString, style: TextStyle(fontFamily: 'Jost', color: CustomColors.Black),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          GestureDetector(
            onTap: () {
              pickFile();
              _unfocusTextField();
            },
            child: DottedBorder(
              color: Colors.black,
              strokeWidth: 3,
              dashPattern: [8, 3],
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              child: Container(
                height: 200,
                alignment: Alignment.center,
                child: fileName == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/unduhan.svg',
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dokumen Gangguan (.csv)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jost'
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Text(
                        fileName!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 40, 15, 25),
              child: Center(
                child: Container(
                  width: 140,
                  height: 50,
                  padding: EdgeInsets.all(0),
                  child: ElevatedButton(
                    onPressed: () {
                      _unfocusTextField();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HasilKlasifikasiGangguan()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: CustomColors.Ziggurat
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(6.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Jost',
                            letterSpacing: 0,
                            color: Colors.black
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _textController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }
}

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final double elevation;

  CustomButton(
      {required this.child,
      required this.onTap,
      this.color = CustomColors.Ziggurat,
      this.borderRadius = 8.0,
      this.padding =
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      this.elevation = 2.0});

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




// Page Hasil Klasifikasi
class DataDisplayPage extends StatelessWidget {
  final TimeOfDay selectedTime1;
  final TimeOfDay selectedTime2;
  final String disturbanceText1;
  final String disturbanceText2;

  const DataDisplayPage({
    Key? key,
    required this.selectedTime1,
    required this.selectedTime2,
    required this.disturbanceText1,
    required this.disturbanceText2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Time 1:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '${selectedTime1.hour}:${selectedTime1.minute}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Time 2:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '${selectedTime2.hour}:${selectedTime2.minute}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Disturbance Text 1:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '$disturbanceText1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Disturbance Text 2:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '$disturbanceText2',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class HasilKlasifikasiGangguan extends StatelessWidget {
  const HasilKlasifikasiGangguan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: BackgroundScreenMenu()),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Positioned(child: TitleDeteksiTrouble()),
                Positioned(child: DataKlasifikasiGangguan())

              ],
            ),
          )
        ],
      ),
    );
  }
}

class DataKlasifikasiGangguan extends StatelessWidget {
  const DataKlasifikasiGangguan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 30, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Hasil Klasifikasi Gangguan 150 KV', style: TextStyle(fontSize: 18.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ),
          SizedBox(height: 30.0),
          Text('Tempat Terjadi Gangguan :', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), ),
          SizedBox(height: 4.0,),
          Text('asasasas', style: TextStyle(fontSize: 14.0, fontFamily: 'Jost', fontWeight: FontWeight.normal), ),
          SizedBox(height: 15.0),
          Text('Waktu Kejadian :', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), ),
          SizedBox(height: 4.0,),
          Text('11.30', style: TextStyle(fontSize: 14.0, fontFamily: 'Jost', fontWeight: FontWeight.normal), ),
          SizedBox(height: 30.0),
          Text('Gangguan Disebabkan Oleh :', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), ),
          SizedBox(height: 4.0,),
          Text('Hewan', style: TextStyle(fontSize: 14.0, fontFamily: 'Jost', fontWeight: FontWeight.normal), ),
          SizedBox(height: 40.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Accuracy :', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), ),
              SizedBox(width: 10.0,),
              Text('18.0', style: TextStyle(fontSize: 14.0, fontFamily: 'Jost', fontWeight: FontWeight.normal), ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Precision :', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), ),
              SizedBox(width: 10.0,),
              Text('38.0', style: TextStyle(fontSize: 14.0, fontFamily: 'Jost', fontWeight: FontWeight.normal), ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Recall :', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), ),
              SizedBox(width: 10.0,),
              Text('28.0', style: TextStyle(fontSize: 14.0, fontFamily: 'Jost', fontWeight: FontWeight.normal), ),
            ],
          ),
          SizedBox(height: 35.0,),
          Text('Nilai Fast Fourier Transform (Grafik) :', style: TextStyle(fontSize: 16.0, fontFamily: 'Jost', fontWeight: FontWeight.bold), ),
          SizedBox(width: 10.0,),
        ],
      ),
    );
  }
}
