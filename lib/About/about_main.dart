import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:ocd/About/general_data.dart';

class MainPageInfo extends StatefulWidget {
  const MainPageInfo({Key key}) : super(key: key);

  @override
  _MainPageInfoState createState() => _MainPageInfoState();
}

class _MainPageInfoState extends State<MainPageInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Swiper(
          loop: false,
          itemCount: features.length,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: MediaQuery.of(context).size.height - 40,
          layout: SwiperLayout.TINDER,
          pagination: const SwiperPagination(
            alignment: Alignment.topLeft,
            builder: DotSwiperPaginationBuilder(
              activeSize: 6,
              space: 6,
            ),
          ),
          itemBuilder: (context, index) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        features[index].name,
                        style: const TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 60,
                          color: Colors.deepPurpleAccent,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 8,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              Text(
                                features[index].description ?? '',
                                maxLines: 25,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
