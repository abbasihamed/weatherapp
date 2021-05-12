import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widget/detail.dart';

class Degree extends StatelessWidget {
  final Weather? weather;
  final String? imageAdd;
  final Size? size;

  Degree({this.weather, this.imageAdd, this.size});

  @override
  Widget build(BuildContext context) {
    Color color =
        weather?.weather?[0]['main'] == 'Clear' ? Colors.black : Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(imageAdd!),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(
              width: size!.width * 0.02,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${(weather?.main?['temp'] - 273.15).toString().substring(0, 1)}',
                  style: GoogleFonts.openSans(
                    fontSize: 90,
                    color: color,
                  ),
                ),
                Text(
                  'o',
                  style: GoogleFonts.openSans(color: color, fontSize: 25),
                ),
                Text(
                  'c',
                  style: GoogleFonts.brawler(color: color, fontSize: 35),
                )
              ],
            ),
          ],
        ),
        Detail(
          weather: weather,
          color: color,
          size: size,
        )
      ],
    );
  }
}
