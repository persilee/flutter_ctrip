import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://dimg04.c-ctrip.com/images/zg0m1e000001ft33l2B3A.jpg',
    'https://dimg04.c-ctrip.com/images/zg0r1f000001g93pa8043.jpg',
    'https://dimg04.c-ctrip.com/images/zg0n1e000001fh5i4F9D7.jpg',
    'https://dimg04.c-ctrip.com/images/zg0p1e000001f50p101A5.jpg',
    'https://dimg04.c-ctrip.com/images/zg0m1e000001ft33l2B3A.jpg',
    'https://dimg04.c-ctrip.com/images/zg0r1f000001g93pa8043.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 182,
              child: Swiper(
                itemCount: _imageUrls.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    _imageUrls[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
