import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dynamic_image.dart';

class ThirdScreen extends StatefulWidget {
  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  final GlobalKey<DynamicImageState> _dynamicImageKey = GlobalKey<DynamicImageState>();
  //static const defaultImage = "https://media1.tenor.com/m/XdwDDzFBQfsAAAAd/gachi-gachimuchi.gif";
  static const defaultImage = "https://media1.tenor.com/m/uL2vgtRWN58AAAAC/stray228-dota2.gif";
  String imageUrl = defaultImage;

  @override
  void initState() {
    super.initState();
    _loadImageUrl();
  }

  // Load the saved image URL from SharedPreferences
  void _loadImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imageUrl = prefs.getString('imageUrl') ?? defaultImage;
      _updateImage(imageUrl);
    });
  }

  // Save the image URL to SharedPreferences
  void _saveImageUrl(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('imageUrl', url);
  }

  void _updateImage(String url) {
    _saveImageUrl(url);
    _dynamicImageKey.currentState?.setImage(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Вставьте ссылку на ваше изображение:'),
            TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Ссылка на изображение",
                fillColor: Colors.black12,
                filled: true,
              ),
              onSubmitted: (text) {
                _updateImage(text);
              },
            ),
            const SizedBox(height: 20),
            DynamicImage(
              imageUrl,
              key: _dynamicImageKey,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
              child: const Text('Перейти к экрану 4'),
            ),
          ],
        ),
      ),
    );
  }
}
