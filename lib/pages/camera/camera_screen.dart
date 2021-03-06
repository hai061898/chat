import 'package:camera/camera.dart';
import 'package:chat/pages/camera/components/video_screen.dart';
import 'package:flutter/material.dart';

import 'components/camera_view.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  Future<void>? cameraValue;
  bool isRecoring = false;
  bool flash = false;
  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = cameraController!.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(cameraController!);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? cameraController!
                                    .setFlashMode(FlashMode.torch)
                                : cameraController!.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                        onLongPress: () async {
                          await cameraController!.startVideoRecording();
                          setState(() {
                            isRecoring = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile videopath =
                              await cameraController!.stopVideoRecording();
                          setState(() {
                            isRecoring = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => VideoScreen(
                                        path: videopath.path,
                                      )));
                        },
                        onTap: () {
                          if (!isRecoring) takePhoto(context);
                        },
                        child: isRecoring
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hold for video, Tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await cameraController!.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraView(
                  path: file.path,
                )));
  }
}
