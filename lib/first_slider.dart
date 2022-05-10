import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ocd/first_page_data.dart';
import 'package:ocd/main.dart';
import 'package:ocd/self_Monitor_pages/situation_class.dart';
import 'About/chapters.dart';
import 'Exposures/exposure_data.dart';
import 'Exposures/situation_collector.dart';
import 'const.dart';
import 'custom_clipper.dart';
import 'self_Monitor_pages/first_main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainPageSlider extends StatefulWidget {
  const MainPageSlider({Key key}) : super(key: key);

  @override
  _MainPageSliderState createState() => _MainPageSliderState();
}

class _MainPageSliderState extends State<MainPageSlider> {
  @override
  void initState() {
    super.initState();
  }

  directRoute(index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SituationPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FirstMainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(children: [
        ClipPath(
          clipper: MyCustomClipper(clipType: ClipType.bottom),
          child: Container(
            color: Theme.of(context).accentColor,
            height: Constants.headerHeight + statusBarHeight,
          ),
        ),
        Positioned(
          right: -45,
          top: -30,
          child: ClipOval(
            child: Container(
              color: Colors.black.withOpacity(0.05),
              height: 220,
              width: 220,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Constants.paddingSide),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Good Morning,\nPatient",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage('assets/profile_picture.png'))
                ],
              ),
              //Word(),
              //Page1(),
              //const MainPageSlider(),
              Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Swiper(
                    loop: false,
                    itemCount: areas.length,
                    itemWidth: MediaQuery.of(context).size.width,
                    itemHeight: MediaQuery.of(context).size.height - 350,
                    layout: SwiperLayout.TINDER,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          activeSize: 6,
                          space: 6,
                          color: Colors.grey,
                          activeColor: Color(0xff38547C)),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          directRoute(areas[index].position);
                        },
                        child: Card(
                          elevation: 8,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  areas[index].status,
                                  style: const TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 35,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      areas[index].description ?? '',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  areas[index].iconImage,
                                  height: 100,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  areas[index].name,
                                  style: const TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 25,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
      floatingActionButton: ElevatedButton.icon(
        label: const Text('Click to know about App'),
        icon: const Icon(Icons.announcement),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChapterInfo()),
          );
        },
      ),
    );
  }
}
