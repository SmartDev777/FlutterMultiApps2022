import 'package:flutter/material.dart';
import 'package:multi_apps_2022/audio_recorder/audio_recorder_player.dart';
import 'package:multi_apps_2022/document_scanner/document_scanner.dart';
import 'package:multi_apps_2022/google_map/google_map_sample.dart';
import 'package:multi_apps_2022/qrcode_scanner/qr_view_example.dart';
import 'package:multi_apps_2022/video_calling/jitsee_meet_screen.dart';
import 'package:multi_apps_2022/video_player/video_player.dart';
import 'package:multi_apps_2022/webview/simple_webview.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Flutter Apps 2022"),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
          
            ElevatedButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const QRViewExample(),
              ));
            }, child: Text("QR CODE Scan")),
          
          
          ElevatedButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  MapSample(),
              ));
            }, child: Text("Google Map")),
          
                             

         
          ElevatedButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DocumentScannerExample(),
              ));
            }, child: Text("Document Scanner1")),
          
          ElevatedButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VoiceRecorderScreen(),
              ));
            }, child: Text("Voice Recorder Player")),
          
                ElevatedButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SimpleWebview(),
              ));
            }, child: Text("Webview")),
          
          
                    ElevatedButton(onPressed: (){
  // Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => Meeting(),
  //             ));
            }, child: Text("Video Call")),
          

         ElevatedButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VideoPlayerTest(),
              ));
            }, child: Text("Video player")),
          ],

        ),
      ),
    );
  }
}