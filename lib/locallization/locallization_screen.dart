import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('welcome-text'.i18n()),
    );
  }
}