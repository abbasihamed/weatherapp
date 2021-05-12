import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<WeatherProvider>(context, listen: false);
    image.weatherImages();
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: PageView(
          controller: _controller,
          children: [
            DegreeScreen(
            ),
            SearchScreen(
              controller: _controller,
            ),
          ],
          onPageChanged: (value) {
            if (value == 0) {
              setState(() {});
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }
}
