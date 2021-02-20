import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';

const apikey =
    "02a07aa866ef4a6f433f4d17e19821f64b030f7c8fc28905aa0a5c54bf9b22e3814a34dce649496a";
const apikey1 =
    "2d1ebab52c4b1c9066eb272798d3e2dea9bc4ddfa07c4918e0ae0aab9a4f48d3f801f7f404f60bc9";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int effectcount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          CameraDeepAr(
            onCameraReady: (isReady) {
              setState(() {});
            },
            onImageCaptured: (path) {
              setState(() {});
            },
            onVideoRecorded: (path) {
              setState(() {});
            },
            cameraDeepArCallback: (c) async {
              cameraDeepArController = c;
              setState(() {});
            },
            androidLicenceKey: apikey,
            iosLicenceKey: apikey1,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: FloatingActionButton(
                      child: Icon(Icons.navigate_next),
                      onPressed: () => {
                            cameraDeepArController.changeMask(effectcount),
                            if (effectcount == 7) {effectcount = 0},
                            effectcount++
                          })))
        ],
      )),
    );
  }
}
