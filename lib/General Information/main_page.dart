import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:ocd/General%20Information/detail_page.dart';
import 'package:ocd/General%20Information/general_data.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({Key key}) : super(key: key);

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'General Info',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                          child: Text(
                        'Topics',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 30,
                          color: Colors.yellow,
                        ),
                        textAlign: TextAlign.left,
                      ))
                    ],
                    onChanged: (value) {},
                    icon: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.arrow_drop_down)),
                    underline: const SizedBox(),
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              padding: EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: features.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeSize: 10,
                    space: 8,
                  ),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailPage(
                                    dataInfo: features[index],
                                  )));
                    },
                    child: Stack(children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Card(
                            elevation: 8,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 100,
                                  ),
                                  Text(
                                    features[index].name,
                                    style: const TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 30,
                                      color: Color(0xff47455f),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const Text(
                                    'OCD',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 23,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 32),
                                  Row(
                                    children: const [
                                      Text(
                                        'Know more',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 18,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.redAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(features[index].iconImage),
                    ]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
