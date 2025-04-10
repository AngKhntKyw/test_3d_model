import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:marqueer/marqueer.dart';
import 'package:test_3d_models/widgets/common_container.dart';
import 'package:test_3d_models/widgets/marquee_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Model',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Flutter3DController flutter3DController;
  late ScrollController scrollController;
  double lastTheta = 0;
  //
  @override
  void initState() {
    flutter3DController = Flutter3DController();
    scrollController = ScrollController();

    scrollController.addListener(() {
      double scrollOffset = scrollController.offset;
      double newTheta = scrollOffset * 0.08;
      if ((newTheta - lastTheta).abs() > 2) {
        double phi = 80;
        double radius = 0;
        flutter3DController.setCameraOrbit(newTheta, phi, radius);
        lastTheta = newTheta;
      } else if (scrollOffset == 0) {
        flutter3DController.setCameraOrbit(-90, 80, 0);
      }

      //
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Flutter3DViewer(
                src: 'assets/assets/3d/free_porsche_911_carrera_4s.glb',
                controller: flutter3DController,
                activeGestureInterceptor: true,
                enableTouch: true,
                progressBarColor: Colors.blueAccent,
                onLoad: (modelAddress) async {
                  flutter3DController.setCameraOrbit(0, 10, 0);
                  await Future.delayed(const Duration(milliseconds: 1000));
                  flutter3DController.setCameraOrbit(-90, 80, 0);
                },
              ),
            ),
            SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //
                  CommonContainer(color: Colors.indigo),

                  //
                  CommonContainer(
                    color: Colors.black,
                    child: Row(
                      children: [
                        Expanded(child: CommonContainer(color: Colors.red)),
                        Expanded(child: CommonContainer(color: Colors.blue)),
                      ],
                    ),
                  ),

                  //
                  CommonContainer(
                    color: Colors.green,
                    child: Row(
                      children: [
                        Expanded(child: CommonContainer(color: Colors.black)),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: CommonContainer(color: Colors.red),
                              ),
                              Expanded(
                                child: CommonContainer(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                  CommonContainer(
                    color: Colors.yellow,
                    child: Column(
                      children: [
                        Expanded(
                          child: Marqueer.builder(
                            autoStartAfter: const Duration(seconds: 1),
                            autoStart: true,
                            direction: MarqueerDirection.rtl,
                            pps: 100,
                            interaction: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return MarqueeContainer(
                                color: Colors.blue,
                                child: Text("$index"),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Marqueer.builder(
                            autoStartAfter: const Duration(seconds: 1),
                            autoStart: true,
                            direction: MarqueerDirection.ltr,
                            pps: 100,
                            interaction: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return MarqueeContainer(
                                color: Colors.red,
                                child: Text("$index"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                  CommonContainer(
                    color: Colors.deepOrange,
                    child: Column(
                      children: [
                        Expanded(child: CommonContainer(color: Colors.blue)),
                        Expanded(child: CommonContainer(color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flutter3DController.setCameraOrbit(lastTheta, 80, 0);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
