import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  var imagePath = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: imagePath == ""
                      ?
                      // widget.imagePath==""?
                      Image.network("", width: 120, height: 120, fit: BoxFit.cover)
                      : Image.file(new File(imagePath),
                          width: 120, height: 120, fit: BoxFit.cover)),
            ),

            ElevatedButton(onPressed: (){
getImageFromCamera();

            }, child: Text("Pick Image"))
          ],
        ),
      ),
    );
  }

  late File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 25);

    if (pickedFile != null) {
      File rotatedImage =
          await FlutterExifRotation.rotateImage(path: pickedFile.path);

      print(pickedFile.path);

      setState(() {
        _image = rotatedImage;
      });
      print("camera Path"+imagePath);
    } else {
      print("error");
    }
  }

  //for base64
  String base64Encode(List<int> bytes) => base64.encode(bytes);
  final pickers = ImagePicker();
  Future getImageFromCameraBase64() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 25);

    print("Picked path : ${pickedFile!.path} ");

    if (pickedFile != null) {
      File rotatedImage =
          await FlutterExifRotation.rotateImage(path: pickedFile.path);
      final bytes = Io.File(rotatedImage.path).readAsBytesSync();

      String img64 = base64Encode(bytes);

      // widget.localPath=pickedFile.path;
      // widget.imagePath=img64;

      // _image=rotatedImage;
      //  print(_image);
      print("camera Path" + img64);
    } else {
      print("error");
    }

    setState(() {});
  }

  //for base64
  String base64EncodeG(List<int> bytes) => base64.encode(bytes);
  final pickersG = ImagePicker();
  Future getImageFromGalleryBase64() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 25);
    if (pickedFile != null) {
      File rotatedImage =
          await FlutterExifRotation.rotateImage(path: pickedFile.path);
      final bytes = Io.File(rotatedImage.path).readAsBytesSync();
      String img64 = base64Encode(bytes);

      // widget.localPath=pickedFile.path;
      // widget.imagePath=img64;
      //  print(_image);
      // isLocalImage=true;
      print("camera Path" + img64);
    } else {
      print("error");
    }

    setState(() {
      // isLocalImage=true;
    });
  }
}
