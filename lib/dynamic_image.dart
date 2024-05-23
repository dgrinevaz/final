import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DynamicImage extends StatefulWidget {
  final String imageToLoad;

  const DynamicImage(this.imageToLoad, {super.key});

  @override
  State<DynamicImage> createState() => DynamicImageState();
}

class DynamicImageState extends State<DynamicImage> {
  late String imageToLoad;

  @override
  void initState() {
    super.initState();
    imageToLoad = widget.imageToLoad;
  }

  void setImage(String newImageToLoad) {
    setState(() {
      imageToLoad = newImageToLoad;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageToLoad,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const SizedBox.shrink(),
    );
  }
}