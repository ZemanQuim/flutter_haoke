import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final networkUriReg = RegExp('^http');
final localUriReg = RegExp('^static');

class CommonImage extends StatelessWidget {
  final String src;
  final double width;
  final double height;
  final BoxFit fit;

  const CommonImage(this.src, {Key key, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (networkUriReg.hasMatch(src)) {
      return CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: src,
        // placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fadeOutDuration: const Duration(seconds: 1),
        fadeInDuration: const Duration(seconds: 2),
      );
    }
    if (localUriReg.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false, '图片地址不合法!');
    return Container();
  }
}
