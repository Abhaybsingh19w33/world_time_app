// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

// here in thhis project we need 3 screens
// show time
// loading screen
// update the location
void main() => runApp(MaterialApp(
        //
        // home: Home(),
        initialRoute: '/',
        routes: {
          // where we are currently using this as howm page
          // due to the conflict between thus and hom eparameter we arer not using home right now
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/location': (context) => ChooseLocation(),
        }));
