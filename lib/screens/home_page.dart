import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/degree_page.dart';
import 'package:weather_app/screens/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _controller;
  FToast? fToast;

  @override
  void initState() {
    
    super.initState();
    _controller = PageController(initialPage: 0);
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherProvider>(context, listen: false);
    data.weatherImages();
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: PageView(
          controller: _controller,
          children: [
            DegreeScreen(),
            SearchScreen(
              controller: _controller,
            ),
          ],
          onPageChanged: (value) {
            print(value);
            if (value == 0) {
              if (data.error) {
                _showToast();
              }
              setState(() {});
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  _showToast() {
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey,
      ),
      child: Text(
        "City not found",
        style: GoogleFonts.openSans(color: Colors.white),
      ),
    );

    fToast?.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }
}
