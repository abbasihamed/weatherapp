import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider())
      ],
      child: MaterialApp(
        title: 'WeatherAppDemo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
