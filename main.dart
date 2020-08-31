import 'package:flutter/material.dart';
import 'dart:async';
import 'package:zeking_device_info/zeking_device_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> size() async {
    List<double> size = [];
    await Zekingdeviceinfo.getDevicesInfo('ZekingDeviceInfoExample').then((value) {
      size.add(value.lateralResolution);
    });
    await Zekingdeviceinfo.getDevicesInfo('ZekingDeviceInfoExample').then((value) {
      size.add(value.verticalResolution);
    });
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zeking Device Info'),
        ),
        body: FutureBuilder(
          future: size(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(child: Text("${snapshot.data[0]} and ${snapshot.data[1]}"));
            } else {
              return Center(child: Text("Loading....."));
            }
          },
        ),
      ),
    );
  }
}
