import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'adaptive_indicator.dart';

class CachedImage extends StatelessWidget {
  final String image;
  Color circularColor;
  BoxFit fit;

  CachedImage(
      {required this.image,
      this.circularColor = Colors.blue,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      key: UniqueKey(),
      fit: fit,
      placeholder: (context, url) => Center(
          child: AdaptiveIndicator(
        os: Platform.operatingSystem,
        color: circularColor,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
