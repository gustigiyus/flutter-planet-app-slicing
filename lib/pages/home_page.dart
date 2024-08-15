import 'package:flutter/material.dart';
import 'package:flutter_latihan_slicing_1/Model/universe_model.dart';
import 'package:flutter_latihan_slicing_1/Utils/app_styles.dart';
import 'package:flutter_latihan_slicing_1/Utils/size_config.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class UniversHomePage extends StatefulWidget {
  const UniversHomePage({super.key});

  @override
  State<UniversHomePage> createState() => _UniversHomePageState();
}

class _UniversHomePageState extends State<UniversHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: secondGradientColor,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [firstGradientColor, secondGradientColor],
          ),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP PARTS
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style: kFontSansExtraBold.copyWith(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal! * 11.25,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Solar System",
                        style: kFontSansMedium.copyWith(
                          color: Colors.white60,
                          fontSize: SizeConfig.blockSizeHorizontal! * 6.25,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.pink[200],
                        size: SizeConfig.blockSizeHorizontal! * 8.75,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //  BODY PARTS
            Container(
              height: SizeConfig.blockSizeVertical! * 72,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Swiper(
                itemCount: planets.length,
                physics: const BouncingScrollPhysics(),
                itemHeight: SizeConfig.blockSizeVertical! * 72,
                itemWidth: double.infinity,
                layout: SwiperLayout.TINDER,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      activeSize: 12, size: 8, activeColor: Colors.white24),
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 12,
                            ),
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 35,
                                  vertical: 35,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          SizeConfig.blockSizeVertical! * 20,
                                    ),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                12.5,
                                        color: const Color.fromARGB(
                                          255,
                                          71,
                                          69,
                                          95,
                                        ),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "Solar System",
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                6.2,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical! * 3,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Know more ",
                                          style: TextStyle(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                4.5,
                                            color: secondaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Image.asset("assets/${planets[index].iconImage}"),
                        Positioned(
                          right: 30,
                          bottom: 70,
                          child: Text(
                            planets[index].id.toString(),
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal! * 35,
                              color: primaryTextColor.withOpacity(0.1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        )),
      ),
      // BOTTOM PARTS
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: navBarColor,
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/menu_icon.png'),
                ),
                const Text(
                  "Explore",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.pink[100],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_outline_outlined,
                size: 30,
                color: Colors.pink[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
