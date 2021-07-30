import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HeaderSwiper extends StatefulWidget {
  final List<String> list;

  const HeaderSwiper({Key? key, required this.list}) : super(key: key);

  @override
  _HeaderSwiperState createState() => _HeaderSwiperState();
}

class _HeaderSwiperState extends State<HeaderSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: widget.list.length,
      itemBuilder: (ctx, i) {
        return Container(
          child: Image.network(widget.list[i]),
        );
      },
      curve: Curves.easeInOutCubic,
      autoplayDelay: 5000,
      autoplay: true,
      duration: 850,
    );
  }
}
