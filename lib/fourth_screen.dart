import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boss of this GYM and the legend of the world'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Fourth Screen'),
            CachedNetworkImage(imageUrl: "https://media1.tenor.com/m/XdwDDzFBQfsAAAAd/gachi-gachimuchi.gif"),
          ],
        ),
      ),
    );
  }
}
