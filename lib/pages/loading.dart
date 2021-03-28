// loadingng screen this will be the first screen to be launched

import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = new WorldTime(
        location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');

    await instance.getTime();
    // navigating to the home widget and passing the data to the home Widget
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  // void getTime() async {
  //   // it get the data about the response we get from the http
  //   Response response =
  //       await get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');

  //   Map data = jsonDecode(response.body);
  //   // print(data);

  //   // get properties from data
  //   String datetime = data['datetime'];
  //   String offsetMinutes = data['utc_offset'].substring(4);
  //   // print(offset_minutes);
  //   String offsetHours = data['utc_offset'].substring(1, 3);
  //   // print(datetime);
  //   // print(offset_hours);

  //   // create a datetime object
  //   DateTime now = DateTime.parse(datetime);
  //   now = now.add(Duration(
  //       hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
  //   print(now);
  // }

  @override
  void initState() {
    super.initState();
    // getTime();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFadingCube(color: Colors.white, size: 50.0),
        ));
  }
}
