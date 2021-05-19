import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class SearchScreen extends StatefulWidget {
  final PageController? controller;

  SearchScreen({this.controller});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  FocusNode node = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final photo = Provider.of<WeatherProvider>(context, listen: false);
    photo.searchPhoto();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  photo.cityPhotoAdd,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.black26),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.04),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await context
                          .read<WeatherProvider>()
                          .weatherRequest(city: textController.text);

                      await widget.controller?.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.ease);
                      node.unfocus();
                    },
                    icon: Icon(Icons.search),
                    color: Colors.white70,
                    iconSize: 32,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: size.width * 0.01),
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    width: size.width * 0.85,
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: TextField(
                        focusNode: node,
                        controller: textController,
                        style: GoogleFonts.openSans(fontSize: 18),
                        cursorColor: Colors.white,
                        cursorHeight: 25,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) async {
                          await context
                              .read<WeatherProvider>()
                              .weatherRequest(city: value);
                          await widget.controller?.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.ease);
                          node.unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: 'City...',
                          hintStyle:
                          GoogleFonts.habibi(color: Colors.black38),
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
    // widget.controller?.dispose();
  }
}
