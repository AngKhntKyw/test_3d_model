import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:marqueer/marqueer.dart';
import 'package:test_3d_models/widgets/about_developer_container.dart';
import 'package:test_3d_models/widgets/common_container.dart';
import 'package:test_3d_models/widgets/marquee_container.dart';
import 'package:test_3d_models/widgets/porsche_logo.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  late Flutter3DController flutter3DController;
  late ScrollController verticalScrollController;
  late ScrollController horizontalScrollController;
  late MarqueerController marqueerController;
  double lastTheta = 0;

  bool startHorizontalScroll = false;
  //

  @override
  void initState() {
    flutter3DController = Flutter3DController();
    verticalScrollController = ScrollController();
    horizontalScrollController = ScrollController();
    marqueerController = MarqueerController();

    verticalScrollController.addListener(() {
      double scrollOffset = verticalScrollController.offset;
      double newTheta = scrollOffset * 0.08;
      if ((newTheta - lastTheta).abs() > 2) {
        flutter3DController.setCameraOrbit(
          newTheta - 90,
          -newTheta + 80,
          newTheta,
        );
        flutter3DController.setCameraTarget(
          -2 + newTheta * 0.01,
          0,
          newTheta * 0.003,
        );
        setState(() {
          lastTheta = newTheta;
        });
      }
      //
    });
    super.initState();
  }

  @override
  void dispose() {
    verticalScrollController.dispose();
    horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    //
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height / 5,
            child: PorscheLogo(theta: lastTheta, logoTheta: 50),
          ),

          SizedBox(
            height: size.height,
            width: size.width,
            child: Flutter3DViewer(
              src: 'assets/assets/3d/free_porsche_911_carrera_4s.glb',
              controller: flutter3DController,
              activeGestureInterceptor: false,
              enableTouch: false,
              progressBarColor: Colors.blueAccent,
              onLoad: (modelAddress) async {
                await Future.delayed(const Duration(milliseconds: 1000));
                flutter3DController.setCameraOrbit(-90, 80, 0);
              },
            ),
          ),

          SingleChildScrollView(
            controller: verticalScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //
                if (!verticalScrollController.hasClients ||
                    verticalScrollController.offset < 850)
                  Padding(
                    padding: EdgeInsets.all(size.height / 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed:
                                  () => Scaffold.of(context).openDrawer(),
                              icon: Icon(Icons.menu),
                            ),
                            Text("Menu"),
                          ],
                        ),
                        Image.asset(
                          'assets/image/text_logo.jpeg',
                          height: size.height / 60,
                        ),
                        Row(
                          children: [Text("Login"), const Icon(Icons.person)],
                        ),
                      ],
                    ),
                  ),
                //
                CommonContainer(
                  color: Colors.indigo,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(""),
                      Column(
                        children: [
                          Text(
                            "Icon and superlative.",
                            style: TextStyle(
                              fontSize: size.height / 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "In 1974, the 911 Turbo proved that even the dream of a 911 could be taken even further: with a fascinating symbiosis of outstanding performance, confident elegance and pure emotion. Experience its 50th anniversary up close: at the wheel of the 911 Turbo 50 years.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //
                CommonContainer(
                  color: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonContainer(
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Taycan Turbo",
                                    style: TextStyle(
                                      fontSize: size.height / 20,
                                    ),
                                  ),
                                  Text("Electro"),
                                  Text(
                                    "from SGD 749,6071",
                                    style: TextStyle(
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height / 45,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                                "The indicative price listed is provided for information purposes only and should not be construed as an offer or attempt of sale. Price is without COE but includes a 5-year free maintenance and warranty package, registration fee, estimated ARF, 12-month road tax, estimated VES fee/rebate, and GST. Prices are subject to change without prior notice. Terms and conditions apply². For plug-in hybrid and battery electric vehicles, CO2 emissions are based on a Singapore specific calculation.",
                              ),
                              Image.asset(
                                'assets/image/logo.png',
                                height: size.height / 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: CommonContainer(color: Colors.red)),
                    ],
                  ),
                ),

                //
                CommonContainer(
                  color: Colors.green,
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonContainer(
                          color: Colors.black,
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonContainer(
                                  color: Colors.blue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Overfeel.",
                                        style: TextStyle(
                                          fontSize: size.height / 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "The overwhelming feeling of sitting in an amazing electric sports car: the new Taycan makes electricity even more electrifying. Performance even more impressive. And the extraordinary even more outstanding.",
                                        style: TextStyle(
                                          fontSize: size.height / 45,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CommonContainer(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CommonContainer(
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '2.7',
                                        style: TextStyle(
                                          fontSize: size.height / 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        's',
                                        style: TextStyle(
                                          fontSize: size.height / 45,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Acceleration 0 - 100 km/h with Launch Control',
                                    style: TextStyle(
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              //
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '650',
                                        style: TextStyle(
                                          fontSize: size.height / 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'kw /',
                                        style: TextStyle(
                                          fontSize: size.height / 45,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '884',
                                        style: TextStyle(
                                          fontSize: size.height / 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'PS',
                                        style: TextStyle(
                                          fontSize: size.height / 45,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Overboost Power with Launch Control up to',
                                    style: TextStyle(
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '(kW)/Overboost Power with Launch Control up to (PS)',
                                    style: TextStyle(
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Details of the measuring method can',
                                    style: TextStyle(
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'be found at www.porsche.com/gtr21',
                                    style: TextStyle(
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                              //
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '260',
                                        style: TextStyle(
                                          fontSize: size.height / 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'km/h',
                                        style: TextStyle(
                                          fontSize: size.height / 45,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Top speed',
                                    style: TextStyle(
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                              //
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "View all technical details",
                                  style: TextStyle(
                                    fontSize: size.height / 45,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //

                //
                CommonContainer(
                  color: Colors.deepOrange,
                  child: Column(
                    children: [
                      Expanded(
                        child: CommonContainer(
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "The legend of the 911 Turbo.",
                                style: TextStyle(
                                  fontSize: size.height / 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Technology leader and timeless sculpture: the 911 Turbo gave the design philosophy “form follows function” an even more exciting meaning – and created a legend that continues to fascinate today.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height / 45,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CommonContainer(
                          color: Colors.blue,
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonContainer(color: Colors.green),
                              ),

                              Expanded(
                                child: CommonContainer(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.8),
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: CommonContainer(
                    color: Colors.blue,
                    child: Image.asset(
                      "assets/image/side.webp",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //
                Container(
                  color: Colors.white,
                  child: CommonContainer(
                    color: Colors.red,
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height / 15,
                          left: size.width / 15,

                          child: Text(
                            "The one and always.",
                            style: TextStyle(
                              fontSize: size.width / 35,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height / 15,
                          right: size.width / 15,
                          child: Container(
                            height: size.height / 1.8,
                            width: size.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/image/good.webp"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: size.height / 15,
                          left: size.width / 15,
                          child: Container(
                            height: size.height / 2,
                            width: size.width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/image/better.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //
                Container(
                  color: Colors.white,
                  child: CommonContainer(
                    color: Colors.cyan,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "- HILIGHTS -",
                              style: TextStyle(
                                fontSize: size.width / 35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              MarqueeContainer(
                                color: Colors.transparent,
                                setWidth: 4,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/image/iris.webp",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              MarqueeContainer(
                                color: Colors.transparent,
                                setWidth: 4,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/image/iris (1).webp",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              MarqueeContainer(
                                color: Colors.transparent,
                                setWidth: 4,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/image/iris (2).webp",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              MarqueeContainer(
                                color: Colors.transparent,
                                setWidth: 4,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/image/iris (3).webp",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              MarqueeContainer(
                                color: Colors.transparent,
                                setWidth: 4,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/image/iris (4).webp",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              MarqueeContainer(
                                color: Colors.transparent,
                                setWidth: 4,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/image/iris (5).webp",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //
                Container(
                  color: Colors.white,

                  child: CommonContainer(
                    color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CommonContainer(
                            color: Colors.red,
                            child: Image.asset(
                              "assets/image/josh-berquist-pjxe3p4u5aI-unsplash.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width / 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "To drive is to feel.",
                                style: TextStyle(
                                  fontSize: size.width / 35,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "The only way to really find out which Porsche is for you is to drive it. Reach out to us now to book a test drive for your preferred model and experience the true sports car feeling firsthand. ",
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {},

                                child: Text("Book test drive"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //
                CommonContainer(
                  color: Colors.green,
                  child: Row(
                    children: [
                      Expanded(child: CommonContainer(color: Colors.blue)),
                      Expanded(
                        child: CommonContainer(
                          color: Colors.yellow,
                          child: AboutDeveloperContainer(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
