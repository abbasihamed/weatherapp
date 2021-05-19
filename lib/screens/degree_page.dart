import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widget/degree.dart';

class DegreeScreen extends StatelessWidget {
  DateTime now = DateTime.now();

  List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];

  List days = [
    'Mondays',
    'Tuesdays',
    'Wednesdays',
    'Thursdays',
    'Fridays',
    'Saturdays',
    'Sundays'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String time = DateFormat('kk:mm').format(now);
    int month = now.month;
    int monthDay = now.day;
    int day = now.weekday;
    int year = now.year;

    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: (context, weather, child) {
          print('build');
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  image: DecorationImage(
                    image: AssetImage(weather.weatherImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black26),
              ),
              !weather.loaded
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 2,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          child: cityAndTime(
                            cityName: weather.weatherData[0]?.name,
                            image: weather.weatherData[0]?.weather?[0]['main'],
                            time: time,
                            month: month,
                            monthDay: monthDay,
                            weekDay: day,
                            year: year,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.2,
                              left: size.width * 0.05),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Degree(
                                weather: weather.weatherData[0],
                                imageAdd: weather.weatherIcon,
                                size: size),
                          ),
                        ),
                        // weather.error ? _showToast(size) : Text(''),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }

  Column cityAndTime(
      {String? cityName,
      String? image,
      String? time,
      int? month,
      int? monthDay,
      int? weekDay,
      int? year}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            cityName ?? 'City',
            style: GoogleFonts.oswald(
              color: image == 'Clear' ? Colors.black : Colors.white,
              fontSize: 55,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Text(
          '$time - ${days[weekDay! - 1]}, $monthDay ${months[month! - 1]} $year',
          style: GoogleFonts.openSans(
            color: image == 'Clear' ? Colors.black : Colors.white,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
