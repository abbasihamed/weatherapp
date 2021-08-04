import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/widget/splash_element.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoad = true;

  @override
  void initState() {
    super.initState();
    checkLoad();
  }

  checkLoad() async {
    final data = Provider.of<WeatherProvider>(context, listen: false);
    await data.weatherRequest();
    data.weatherImages();
    if (data.weatherData.isNotEmpty) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          _isLoad = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size.height);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SplashElements(
            alignment: Alignment.topLeft,
            size: size,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(180),
            ),
          ),
          _isLoad
              ? Image.asset(
                  'assets/gif/splash_anim.gif',
                  width: size.width * 0.35,
                )
              : TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ),
                    );
                  },
                  child: Text('Refresh'),
                ),
          SplashElements(
            alignment: Alignment.bottomRight,
            size: size,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(180),
            ),
          )
        ],
      ),
    );
  }
}
