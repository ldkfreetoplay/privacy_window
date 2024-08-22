import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:privacy_window/privacy_window.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _privacyWindowPlugin = PrivacyWindow();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextButton(
              onPressed: (){
                _privacyWindowPlugin.setPrivacyWindow();
            }, 
            child: Text("set")),
            SizedBox(height: 20),
            TextButton(
              onPressed: (){
                _privacyWindowPlugin.setPrivacyWindow();
            }, 
            child: Text("unSet"))
          ],),
        ),
      ),
    );
  }
}
