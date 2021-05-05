import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:haoke/widgets/common_Image.dart';

const List<String> defaultImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];
//图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;

class CommonSwiper extends StatelessWidget {
  final List<String> images;

  const CommonSwiper({Key key, this.images = defaultImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width / imageWidth * imageHeight;
    return Container(
        height: height,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return CommonImage(
              images[index],
              fit: BoxFit.fill,
            );
          },

          // indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: images.length,
          pagination: new SwiperPagination(),
          // control: new SwiperControl(),//左右箭头
        ));
  }
}
