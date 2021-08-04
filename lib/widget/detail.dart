import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/weather_model.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  Weather? weather;
  Color? color;
  final Size? size;

  Detail({this.weather, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          '${weather?.wind?['humidity'] ?? 0}',
          style: GoogleFonts.openSansCondensed(
            color: color,
            fontSize: 25,
          ),
        ),
        Image.asset(
          'assets/images/wet.png',
          height: size!.height * 0.05,
          width: size!.width * 0.06,
        ),
        SizedBox(
          width: size!.width * 0.015,
        ),
        Text(
          '${weather?.main?['speed'] ?? 0}',
          style: GoogleFonts.openSansCondensed(
            color: color,
            fontSize: 25,
          ),
        ),
        Image.asset(
          'assets/images/wind.png',
          height: size!.height * 0.05,
          width: size!.width * 0.06,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size!.width * 0.02),
          width: 2,
          height: size!.height * 0.04,
          color: Colors.grey,
        ),
        Text(
          weather?.weather?[0]['description'] ?? 'sky',
          style: GoogleFonts.openSansCondensed(color: color, fontSize: 25),
        )
      ],
    );
  }
}
