import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:test_3d_models/widgets/common_container.dart';

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
                src: 'assets/3d/free_porsche_911_carrera_4s.glb',
                controller: flutter3DController,
                activeGestureInterceptor: true,
                enableTouch: true,
                progressBarColor: Colors.red,
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
                  // ListView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemCount: 40,
                  //   itemBuilder: (context, index) {
                  //     return ListTile(title: Text("Index ${index + 1}"));
                  //   },
                  // ),

                  //
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      color: Colors.red.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    padding: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonContainer(
                            color: Colors.blue,
                            name: "HOTTEST",
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              color: Colors.blue.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(
                              MediaQuery.sizeOf(context).width / 80,
                            ),
                            padding: EdgeInsets.all(
                              MediaQuery.sizeOf(context).width / 80,
                            ),
                            child: Text("Porsche"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      color: Colors.blue.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    padding: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    child: Text("Porsche"),
                  ),
                  //
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    padding: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    child: Text("Porsche"),
                  ),

                  //
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      color: Colors.green.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    padding: EdgeInsets.all(
                      MediaQuery.sizeOf(context).width / 80,
                    ),
                    child: Text("Porsche"),
                  ),

                  //
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
