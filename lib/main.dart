
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:multi_apps_2022/home_screen.dart';
import 'package:multi_apps_2022/locallization/locallization_screen.dart';
import 'package:multi_apps_2022/media/image_picker_screen.dart';
import 'package:multi_apps_2022/video_calling/jitsee_meet_screen.dart';
import 'package:multi_apps_2022/webview/simple_webview.dart';
import 'package:multi_apps_2022/webview/webview_screen.dart';

import 'generated/l10n.dart';


void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    
    return const MaterialApp(
       localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
        // LocalJsonLocalization.delegate,
      ],
      home:  LocalizationScreen(),
    );
  }
}