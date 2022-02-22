import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ocd/Exposures/onboarding_display.dart';
import 'package:ocd/first_page_data.dart';
import 'self_Monitor_pages/onboarding_screen_self_monitoring.dart';

class MainPageSlider extends StatefulWidget {
  const MainPageSlider({Key key}) : super(key: key);

  @override
  _MainPageSliderState createState() => _MainPageSliderState();
}

class _MainPageSliderState extends State<MainPageSlider> {
  directRoute(index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen1()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      Text(
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
    );
  }
}
